import 'package:flutter/material.dart';

import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/language/language_keys.dart';
import '../constants/other_widget_keys.dart';
import '../view-model/others_profile_view_model.dart';

class OthersProfileScreen extends BaseView<OthersProfileViewModel> {
  OthersProfileScreen({required String username, Key? key})
      : super(
          builder: (BuildContext context) => _builder(context, username),
          appBar: _appBarBuilder,
          scrollable: true,
          key: key,
        );

  static Widget _builder(BuildContext context, String username) =>
      Center(child: Text(username));

  static DefaultAppBar _appBarBuilder(BuildContext context) => DefaultAppBar(
        size: context.height * 6,
        color: context.lightDarkActiveColor,
        actionsList: <Widget>[
          Padding(padding: EdgeInsets.all(context.responsiveSize * .6)),
          BaseIconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icons.arrow_back_outlined,
            color: context.lightDarkActiveColor,
          ),
        ],
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 3,
            vertical: context.responsiveSize * 2.5),
      );
/*
  static Widget get _enrolledLearningSpacesButton => ActionButton(
        key: OtherProfileKeys.otherEnrolledLearningSpacesButton,
        text: TextKeys.enrolledLS,
        padding: EdgeInsets.symmetric(
            horizontal: context.responsiveSize * 2.8,
            vertical: context.responsiveSize * 1.4),
        isActive: true, //learningSpaces.isNotEmpty,
        onPressed: () async =>
            context.read<HomeViewModel>().viewAll(TextKeys.takenLearningSpaces),
      );
      */
}
