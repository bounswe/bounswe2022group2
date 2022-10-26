import 'dart:io';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../core/extensions/context/context_extensions.dart';
import '../../../core/extensions/context/theme_extensions.dart';
import '../../../core/helpers/selector_helper.dart';
import '../../../core/helpers/validators.dart';
import '../../../core/providers/theme/theme_provider.dart';
import '../../../core/widgets/base-icon/base_icon.dart';
import '../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../core/widgets/text/base_text.dart';
import '../../../product/constants/icon_keys.dart';
import '../../../product/language/language_keys.dart';
import '../../../product/theme/dark_theme.dart';
import '../../../product/theme/general_theme.dart';
import '../../../product/theme/light_theme.dart';
import '../constants/widget_keys.dart';
import '../view-model/profile_view_model.dart';

part 'components/profile_chart.dart';
part 'components/profile_form.dart';

class ProfileScreen extends BaseView<ProfileViewModel> {
  const ProfileScreen({Key? key})
      : super(
          builder: _builder,
          scrollable: true,
          hasScaffold: false,
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
            context.sizedH(1.7),
            _totalCountRow(context),
            Transform.scale(scale: .85, child: const _ProfileChart()),
          ],
        ),
      );

  static Widget get _profilePhoto =>
      SelectorHelper<String?, ProfileViewModel>().builder(
        (_, ProfileViewModel model) => model.selectedImage,
        (BuildContext context, String? path, __) {
          final File? file = path == null ? null : File(path);
          final ImageProvider imageProvider = file != null
              ? FileImage(file)
              // ignore: unnecessary_cast
              : (const AssetImage(IconKeys.userProfile)
                  as ImageProvider<Object>);
          return CircleAvatar(
            foregroundImage: imageProvider,
            radius: context.width * 12,
            foregroundColor: LightAppTheme.lightBlue,
            backgroundColor: LightAppTheme.lightBlue,
          );
        },
      );

  static Widget _pickImageRow(BuildContext context) => IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _pickerRow(
                context, Icons.camera_alt_outlined, TextKeys.takePhoto, false),
            _verticalDivider(context),
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

  static Widget _totalCountRow(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: context.responsiveSize * 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            color: LightAppTheme.lightBlue.withOpacity(.8),
            padding: EdgeInsets.all(context.responsiveSize * 2.5),
            child: IntrinsicHeight(
              child: Row(
                children: <Widget>[
                  Expanded(child: _countColumn(context, 14, TextKeys.friends)),
                  _verticalDivider(context,
                      color: DarkAppTheme.lightActiveColor),
                  Expanded(child: _countColumn(context, 4, TextKeys.enrolled)),
                  _verticalDivider(context,
                      color: DarkAppTheme.lightActiveColor),
                  Expanded(
                      child: _countColumn(context, 3, TextKeys.contributed)),
                ],
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

  static Widget _verticalDivider(BuildContext context, {Color? color}) =>
      VerticalDivider(
        color: color ?? context.primary,
        thickness: 1,
        width: 1,
        indent: 1,
        endIndent: 1,
      );
}
