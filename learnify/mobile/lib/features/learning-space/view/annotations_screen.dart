import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/constants/storage_keys.dart';
import '../../../product/language/language_keys.dart';
import '../view-model/annotations_view_model.dart';

part './components/text_item.dart';

class AnnotationsScreen extends BaseView<AnnotationsViewModel> {
  AnnotationsScreen({required String annotatedText, Key? key})
      : super(
            builder: (BuildContext context) => _builder(context, annotatedText),
            appBar: _appBarBuilder,
            scrollable: true,
            key: key);

  static Widget _builder(BuildContext context, String annotatedText) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          context.sizedH(2),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: _targetText(context, annotatedText)),
          context.sizedH(2),
          TextItem(
            creator: StorageKeys.user.name,
            content:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            upvotes: 10,
          ),
          const TextItem(
            creator: "ezgi",
            content:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            upvotes: 8,
          ),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
          const TextItem(
              creator: "ezgi",
              content:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        ],
      );

  static Widget _targetText(BuildContext context, String target,
          {Color? color}) =>
      Text(target, style: context.displayLarge);

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
