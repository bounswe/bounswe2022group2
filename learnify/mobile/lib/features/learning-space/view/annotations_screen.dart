import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/managers/local/local_manager.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/image/cropped_image_painter.dart';
import '../../../core/widgets/indicators/custom_loading_indicator.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/storage_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../auth/verification/model/user_model.dart';
import '../models/annotation/annotation_model.dart';
import '../view-model/annotations_view_model.dart';

part './components/text_item.dart';

class AnnotationsScreen extends BaseView<AnnotationsViewModel> {
  AnnotationsScreen(
      {List<Annotation> annotations = const <Annotation>[],
      String? annotatedText,
      Key? key})
      : super(
          builder: (BuildContext context) =>
              _builder(context, annotations, annotatedText),
          appBar: _appBarBuilder,
          scrollable: true,
          key: key,
        );

  static Widget _builder(BuildContext context, List<Annotation> annotations,
          String? annotatedText) =>
      Column(
        children: <Widget>[
          context.sizedH(2),
          if (annotations.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: _targetText(context, annotations, annotatedText),
            ),
          context.sizedH(2),
          ...List<Widget>.generate(
            annotations.length,
            (int i) {
              final Annotation a = annotations[i];
              return TextItem(
                creator: a.creator ?? "ezgi ezgi",
                content: a.content ??
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...",
                upvotes: a.upVote ?? Random().nextInt(30),
              );
            },
          ),
        ],
      );

  static Future<ui.Image> getImage(String path) async {
    final Completer<ImageInfo> completer = Completer<ImageInfo>();
    final NetworkImage img = NetworkImage(path);
    img
        .resolve(ImageConfiguration.empty)
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    }));
    final ImageInfo imageInfo = await completer.future;
    return imageInfo.image;
  }

  static Widget _targetText(BuildContext context, List<Annotation> annotations,
      String? annotatedText) {
    final Annotation a = annotations.first;
    Rect rect = Rect.fromPoints(a.startOffset, a.endOffset);
    for (final Annotation annotation in annotations) {
      rect = rect.intersect(
          Rect.fromPoints(annotation.startOffset, annotation.endOffset));
    }
    return a.isImage
        ? FutureBuilder<ui.Image>(
            future: getImage(a.imageUrl ?? ''),
            builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CustomPaint(
                  painter: CroppedImagePainter(snapshot.data, rect),
                  child: SizedBox(
                    width: a.endOffset.dx - a.startOffset.dx,
                    height: a.endOffset.dy - a.startOffset.dy,
                  ),
                );
              } else {
                return CustomLoadingIndicator(context);
              }
            })
        : Text(annotatedText ?? '', style: context.displayLarge);
  }

  static DefaultAppBar _appBarBuilder(BuildContext context) => DefaultAppBar(
        size: context.height * 6,
        color: context.lightDarkActiveColor,
        actionsList: <Widget>[
          BaseText(
            TextKeys.viewAnnotations,
            style: context.titleMedium,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ],
        showBack: true,
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
}
