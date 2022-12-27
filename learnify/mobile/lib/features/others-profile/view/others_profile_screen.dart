import 'dart:convert';
import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/providers/theme/theme_provider.dart';
import '../../../core/widgets/app-bar/default_app_bar.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/buttons/base_icon_button.dart';
import '../../../core/widgets/divider/custom_vertical_divider.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../core/widgets/text/multiline_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../../../product/theme/dark_theme.dart';
import '../../../product/theme/general_theme.dart';
import '../../../product/theme/light_theme.dart';
import '../../profile/model/profile_model.dart';
import '../constants/other_widget_keys.dart';
import '../view-model/others_profile_view_model.dart';

part 'components/others_info.dart';
part 'components/others_chart.dart';

class OthersProfileScreen extends BaseView<OthersProfileViewModel> {
  OthersProfileScreen({required String username, Key? key})
      : super(
          builder: _builder,
          appBar: _appBarBuilder,
          futureInit: (BuildContext context) async =>
              context.read<OthersProfileViewModel>().getProfile(username),
          scrollable: true,
          key: key,
        );

  static Widget _builder(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: context.height * 3),
        child: Column(
          children: <Widget>[
            _profilePhoto,
            context.sizedH(1),
            const _OthersInfo(),
            context.sizedH(1),
            _totalCountRow(context),
            context.sizedH(2),
            _enrolledLearningSpacesButton,
            context.sizedH(1),
            _createdLearningSpacesButton,
            context.sizedH(1),
            Transform.scale(scale: .85, child: const _ProfileChart()),
            context.sizedH(1),
          ],
        ),
      );

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

  static Widget get _profilePhoto =>
      SelectorHelper<Profile?, OthersProfileViewModel>().builder(
        (_, OthersProfileViewModel model) => model.profile,
        (BuildContext context, Profile? profile, __) {
          // ignore: unnecessary_cast
          ImageProvider imageProvider = const AssetImage(IconKeys.userProfile);
          late final CircleAvatar circleAvatar;
          try {
            if (profile!.profilePicture != null) {
              final Image receivedImg =
                  Image.memory(base64Decode(profile.profilePicture!));
              imageProvider = receivedImg.image;
            }
            circleAvatar = CircleAvatar(
              foregroundImage: imageProvider,
              radius: context.width * 12,
              foregroundColor: LightAppTheme.lightBlue,
              backgroundColor: LightAppTheme.lightBlue,
            );
          } on FileSystemException catch (e) {
            debugPrint(e.toString());
            circleAvatar = const CircleAvatar();
          }
          return circleAvatar;
        },
      );

  static Widget get _enrolledLearningSpacesButton =>
      SelectorHelper<Profile?, OthersProfileViewModel>().builder(
        (_, OthersProfileViewModel model) => model.profile,
        (BuildContext context, Profile? profile, _) => ActionButton(
          text: TextKeys.enrolledLS,
          padding: EdgeInsets.symmetric(
              horizontal: context.responsiveSize * 2.8,
              vertical: context.responsiveSize * 1.4),
          isActive: profile!.participated.isNotEmpty,
          onPressed: () async => NavigationManager.instance.navigateToPage(
              path: NavigationConstants.viewall,
              data: <String, dynamic>{
                'listOfLearningSpaces': profile.participated,
                'learningSpacesType': TextKeys.takenLearningSpaces,
              }),
        ),
      );

  static Widget get _createdLearningSpacesButton =>
      SelectorHelper<Profile?, OthersProfileViewModel>().builder(
        (_, OthersProfileViewModel model) => model.profile,
        (BuildContext context, Profile? profile, _) => ActionButton(
          text: TextKeys.createdLearningSpaces,
          padding: EdgeInsets.symmetric(
              horizontal: context.responsiveSize * 2.8,
              vertical: context.responsiveSize * 1.4),
          isActive: profile!.created.isNotEmpty,
          onPressed: () async => NavigationManager.instance.navigateToPage(
              path: NavigationConstants.viewall,
              data: <String, dynamic>{
                'listOfLearningSpaces': profile.created,
                'learningSpacesType': TextKeys.createdLearningSpaces,
              }),
        ),
      );

  static Widget _totalCountRow(BuildContext context) =>
      SelectorHelper<Profile, OthersProfileViewModel>().builder(
        (_, OthersProfileViewModel model) => model.profile,
        (BuildContext context, Profile profile, _) => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: context.responsiveSize * 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: LightAppTheme.lightBlue.withOpacity(.8),
              padding: EdgeInsets.all(context.responsiveSize * 2.5),
              child: IntrinsicHeight(
                child: Row(
                  children: <Widget>[
                    Expanded(child: _countColumn(context, 0, TextKeys.friends)),
                    const CustomVerticalDivider(
                        color: DarkAppTheme.lightActiveColor),
                    Expanded(
                        child: _countColumn(context,
                            profile.participated.length, TextKeys.enrolled)),
                    const CustomVerticalDivider(
                        color: DarkAppTheme.lightActiveColor),
                    Expanded(
                        child: _countColumn(
                            context, profile.created.length, TextKeys.created)),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  static Widget _countColumn(
          BuildContext context, int countNumber, String titleKey) =>
      Column(
        children: <Widget>[
          BaseText(
            countNumber.toString(),
            style: context.bodyLarge,
            color: context.activeColor,
            fontWeight: FontWeight.bold,
            translated: false,
          ),
          context.sizedH(.3),
          BaseText(
            titleKey,
            style: context.bodyMedium,
            color: context.activeColor.withOpacity(.8),
          ),
        ],
      );
}
