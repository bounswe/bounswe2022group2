import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/helpers/selector_helper.dart';
import '../../../../core/helpers/url_launcher_helper.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/managers/navigation/navigation_manager.dart';
import '../../../../core/widgets/buttons/action_button.dart';
import '../../../../core/widgets/checkbox/custom_checkbox_tile.dart';
import '../../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../../core/widgets/text-field/obscured_text_form_field.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../product/constants/icon_keys.dart';
import '../../../../product/constants/link_keys.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';
import '../view-model/signup_view_model.dart';

part './components/signup_form.dart';

class SignupScreen extends BaseView<SignupViewModel> {
  const SignupScreen({Key? key})
      : super(builder: _builder, scrollable: true, key: key);

  static Widget _builder(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(IconKeys.learnIllustration, width: context.width * 45),
          context.sizedH(1),
          _title(context, TextKeys.signupTo),
          context.sizedH(1),
          Image.asset(IconKeys.logo, width: context.width * 50),
          context.sizedH(2.6),
          const _SignupForm(),
          context.sizedH(.8),
          _checkboxTile(context),
          context.sizedH(2.2),
          _signupButton,
          context.sizedH(1.8),
          _alreadyHaveAccount(context),
        ],
      );

  static Widget _title(BuildContext context, String key, {Color? color}) =>
      BaseText(key, style: context.displayLarge, color: color);

  static Widget _checkboxTile(BuildContext context) {
    final SignupViewModel model = context.read<SignupViewModel>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.responsiveSize * 14),
      child: CustomCheckboxTile(
        key: SignupKeys.privacyCheckbox,
        onTap: model.setAcceptedAgreement,
        text: TextKeys.termsAgreementText,
        replaceValues: <ReplaceValue>[
          _replaceValue(
              context, TextKeys.generalTerms, LinkKeys.termsAndConditions),
          _replaceValue(
              context, TextKeys.privacyPolicy, LinkKeys.privacyPolicy),
        ],
        initialValue: model.acceptedAgreement,
        color: context.activeColor,
        sizedCheckbox: true,
      ),
    );
  }

  static Widget get _signupButton =>
      SelectorHelper<bool, SignupViewModel>().builder(
        (_, SignupViewModel model) => model.canSignup,
        (BuildContext context, bool canSignup, _) {
          final SignupViewModel model = context.read<SignupViewModel>();
          return ActionButton(
            text: TextKeys.signup,
            padding: EdgeInsets.symmetric(
                horizontal: context.responsiveSize * 2.8,
                vertical: context.responsiveSize * 1.4),
            capitalizeAll: true,
            isActive: canSignup,
            onPressedError: model.signup,
          );
        },
      );

  static ReplaceValue _replaceValue(
          BuildContext context, String text, String url) =>
      ReplaceValue(
        text,
        color: context.primary,
        onClick: () async => UrlLauncherHelper.launch(url),
      );

  static Widget _alreadyHaveAccount(BuildContext context) => BaseText(
        TextKeys.alreadyHaveAccount,
        style: context.bodySmall,
        replaceValues: <ReplaceValue>[
          ReplaceValue(
            TextKeys.login,
            onClick: () async => NavigationManager.instance
                .navigateToPage(path: NavigationConstants.login),
            color: context.primary,
          )
        ],
      );
}
