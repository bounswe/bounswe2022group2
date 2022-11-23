import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../view-model/annotations_view_model.dart';

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
          _targetText(context, annotatedText),
          context.sizedH(2),
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
            onPressed: () async => NavigationManager.instance
                .navigateToPageClear(path: NavigationConstants.learningSpace),
            icon: Icons.arrow_back_outlined,
            color: context.lightActiveColor,
          ),
          Padding(
            padding: EdgeInsets.only(left: context.width * 4),
            child: BaseText(
              TextKeys.annotateText,
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
