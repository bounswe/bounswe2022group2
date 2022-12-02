import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/storage_keys.dart';
import '../../../product/language/language_keys.dart';
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          context.sizedH(2),
          if (annotations.isNotEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
              ),
              // child: _targetText(context, annotations.first, annotatedText),
            ),
          context.sizedH(2),
          ...List<Widget>.generate(
            annotations.length,
            (int i) {
              final Annotation a = annotations[i];
              return TextItem(
                creator: StorageKeys.user.name,
                content: a.content ??
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's...",
                upvotes: a.upVote ?? Random().nextInt(30),
              );
            },
          ),
        ],
      );

  // static Widget _targetText(
  //         BuildContext context, Annotation a, String? annotatedText) =>
  //     a.isImage
  //         ? AnnotatableImage()
  //         : Text(annotatedText ?? '', style: context.displayLarge);

  static DefaultAppBar _appBarBuilder(BuildContext context) => DefaultAppBar(
        size: context.height * 6,
        color: context.lightActiveColor,
        actionsList: <Widget>[
          Padding(
            padding: EdgeInsets.all(context.responsiveSize * .6),
          ),
          BaseIconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icons.arrow_back_outlined,
            color: context.lightActiveColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: context.width * 4),
            child: BaseText(
              TextKeys.viewAnnotations,
              style: context.titleMedium,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
}
