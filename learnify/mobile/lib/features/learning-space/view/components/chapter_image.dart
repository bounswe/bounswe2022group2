import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../../core/widgets/dialog/dialog_builder.dart';
import '../../../../core/widgets/image/annotatable_image.dart';
import '../../../../core/widgets/image/image_painter.dart';
import '../../../../product/language/language_keys.dart';
import '../../../home/view-model/home_view_model.dart';
import '../../models/annotation/annotation_model.dart';
import '../../models/learning_space_model.dart';
import '../../view-model/learning_space_view_model.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    required this.imageUrl,
    required this.allAnnotations,
    required this.postId,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final List<Annotation> allAnnotations;
  final String postId;
  static DefaultAppBar _appBar(BuildContext context) => DefaultAppBar(
        size: context.height * 6,
        showBack: true,
        titleText: TextKeys.annotateImage,
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );

  @override
  Widget build(BuildContext context) {
    final List<Annotation> imageAnnotations = allAnnotations
        .where((Annotation a) => a.isImage && a.imageUrl == imageUrl)
        .toList();
    return Scaffold(
      appBar: PostImage._appBar(context),
      body: Center(
        child: AnnotatableImage(
          networkUrl: imageUrl,
          isScalable: false,
          clickable: true,
          initialColor: context.primary,
          initialPaintMode: PaintMode.rect,
          paintHistory:
              List<PaintInfo>.generate(imageAnnotations.length, (int i) {
            final Annotation a = imageAnnotations[i];
            final Tuple2<Offset, Offset> offsets = a.startEndOffsets;
            return PaintInfo(
              annotation: a,
              offset: <Offset>[offsets.item1, offsets.item2],
              painter: Paint()
                ..color = a.color
                ..strokeWidth = 4
                ..style = PaintingStyle.stroke,
            );
          }),
          annotateCallback: (Offset start, Offset end, Color color) async {
            final Offset foundStart =
                Offset(min(start.dx, end.dx), min(start.dy, end.dy));
            final Offset foundEnd =
                Offset(max(start.dx, end.dx), max(start.dy, end.dy));
            return DialogBuilder(context).annotateDialog(
              postId,
              imageCallback: (Offset startOffset,
                  Offset endOffset,
                  String annotation,
                  String? postId,
                  Color color,
                  String imageUrl) async {
                final HomeViewModel viewModel = context.read<HomeViewModel>();
                final Tuple3<LearningSpace?, Annotation?, String?> res =
                    await context.read<LearningSpaceViewModel>().annotateImage(
                          startOffset,
                          endOffset,
                          annotation,
                          postId,
                          color,
                          imageUrl,
                        );
                viewModel.updateLs(res.item1);
                return Tuple2<Annotation?, String?>(res.item2, res.item3);
              },
              startOffset: foundStart,
              endOffset: foundEnd,
              color: color,
              imageUrl: imageUrl,
            );
          },
        ),
      ),
    );
  }
}
