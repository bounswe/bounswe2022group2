import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/managers/navigation/navigation_manager.dart';
import '../../../core/providers/theme/theme_provider.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/buttons/action_button.dart';
import '../../../core/widgets/divider/custom_vertical_divider.dart';
import '../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../../../product/theme/dark_theme.dart';
import '../../../product/theme/general_theme.dart';
import '../../../product/theme/light_theme.dart';
import '../constants/widget_keys.dart';
import '../model/profile_model.dart';
import '../view-model/profile_view_model.dart';

part 'components/profile_chart.dart';
part 'components/profile_form.dart';

class ProfileScreen extends BaseView<ProfileViewModel> {
  ProfileScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
          futureInit: (BuildContext context) async =>
              context.read<ProfileViewModel>().initView(),
          key: key,
        );

  static Widget _builder(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(vertical: context.height * 3),
        child: Column(
          children: <Widget>[
            _profilePhoto,
            context.sizedH(1),
            _pickImageRow(context),
            context.sizedH(2),
            const _ProfileForm(),
            context.sizedH(1),
            _updateButton,
            context.sizedH(2),
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

  static Widget get _profilePhoto =>
      SelectorHelper<String?, ProfileViewModel>().builder(
        (_, ProfileViewModel model) => model.selectedImage,
        (BuildContext context, String? selectedImage, __) {
          // ignore: unnecessary_cast
          ImageProvider imageProvider = const AssetImage(IconKeys.userProfile);
          late final CircleAvatar circleAvatar;
          try {
            if (selectedImage != null) {
              final Image receivedImg =
                  Image.memory(base64Decode(selectedImage));
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

  static Widget _pickImageRow(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _pickerRow(
                context, Icons.camera_alt_outlined, TextKeys.takePhoto, false),
            const CustomVerticalDivider(),
            _pickerRow(context, Icons.file_present_outlined,
                TextKeys.chooseFromGallery, true),
          ],
        ),
      );

  static Widget _pickerRow(
      BuildContext context, IconData icon, String textKey, bool isGallery) {
    final BaseIcon iconWidget =
        BaseIcon(context, icon, size: context.responsiveSize * 6);
    final BaseText textWidget = BaseText(textKey, style: context.bodySmall);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsiveSize * 2.5),
      child: GestureDetector(
        onTap: () => context
            .read<ProfileViewModel>()
            .pickImage(isGallery ? ImageSource.gallery : ImageSource.camera),
        child: Row(
          children: <Widget>[
            if (!isGallery) iconWidget else textWidget,
            context.sizedW(1.2),
            if (isGallery) iconWidget else textWidget,
          ],
        ),
      ),
    );
  }

  static Widget get _updateButton =>
      SelectorHelper<bool, ProfileViewModel>().builder(
        (_, ProfileViewModel model) => model.canUpdate,
        (BuildContext context, bool canUpdate, _) {
          final ProfileViewModel model = context.read<ProfileViewModel>();
          return ActionButton(
            key: ProfileKeys.updateButton,
            text: TextKeys.update,
            padding: EdgeInsets.symmetric(
                horizontal: context.responsiveSize * 2.8,
                vertical: context.responsiveSize * 1.4),
            capitalizeAll: true,
            isActive: canUpdate,
            onPressedError: () async => model.updateProfile(),
          );
        },
      );

  static Widget get _enrolledLearningSpacesButton =>
      SelectorHelper<Profile?, ProfileViewModel>().builder(
        (_, ProfileViewModel model) => model.profile,
        (BuildContext context, Profile? profile, _) => ActionButton(
          key: ProfileKeys.enrolledLearningSpacesButton,
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
      SelectorHelper<Profile?, ProfileViewModel>().builder(
        (_, ProfileViewModel model) => model.profile,
        (BuildContext context, Profile? profile, _) => ActionButton(
          key: ProfileKeys.createdLearningSpacesButton,
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
      SelectorHelper<Profile, ProfileViewModel>().builder(
        (_, ProfileViewModel model) => model.profile,
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
