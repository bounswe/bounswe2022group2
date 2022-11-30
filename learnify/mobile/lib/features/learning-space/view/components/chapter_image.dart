import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../../core/widgets/dialog/dialog_builder.dart';
import '../../../../core/widgets/image/annotatable_image.dart';
import '../../../../core/widgets/image/image_painter.dart';
import '../../models/annotation_model.dart';
import '../../view-model/learning_space_view_model.dart';

class ChapterImage extends StatelessWidget {
  const ChapterImage({
    required this.imageUrl,
    required this.allAnnotations,
    required this.chapterId,
    Key? key,
  }) : super(key: key);
  final String imageUrl;
  final List<Annotation> allAnnotations;
  final String chapterId;
  static DefaultAppBar _appBar(BuildContext context) => DefaultAppBar(
        size: context.height * 6,
        showBack: true,
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
      appBar: ChapterImage._appBar(context),
      body: Center(
        child: AnnotatableImage.network(
          imageUrl,
          scalable: false,
          initialColor: context.primary,
          initialPaintMode: PaintMode.rect,
          paintHistory:
              List<PaintInfo>.generate(imageAnnotations.length, (int i) {
            final Annotation a = imageAnnotations[i];
            return PaintInfo(
              offset: <Offset>[a.startOffset, a.endOffset],
              painter: Paint()
                ..color = a.color
                ..strokeWidth = 4
                ..style = PaintingStyle.stroke,
            );
          }),
          annotateCallback: (Offset start, Offset end, Color color) async =>
              await DialogBuilder(context).annotateDialog(
                chapterId,
                imageCallback:
                    context.read<LearningSpaceViewModel>().annotateImage,
                startOffset: start,
                endOffset: end,
                color: color,
                imageUrl: imageUrl,
              ) ??
              false,
        ),
      ),
    );
  }
}
