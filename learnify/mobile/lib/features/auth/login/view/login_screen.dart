import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/helpers/selector_helper.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/managers/navigation/navigation_manager.dart';
import '../../../../core/widgets/buttons/action_button.dart';
import '../../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../../core/widgets/text-field/obscured_text_form_field.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../product/constants/icon_keys.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';
import '../view-model/login_view_model.dart';

part './components/login_form.dart';

class LoginScreen extends BaseView<LoginViewModel> {
  const LoginScreen({Key? key})
      : super(builder: _builder, scrollable: true, key: key);

  static Widget _builder(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(IconKeys.learnIllustration, width: context.width * 45),
          context.sizedH(1),
          _title(context, TextKeys.loginTo),
          context.sizedH(1),
          Image.asset(IconKeys.logo, width: context.width * 50),
          context.sizedH(2.6),
          const _LoginForm(),
          context.sizedH(2.2),
          _loginButton,
          context.sizedH(1.8),
          _createNewAccount(context),
        ],
      );

  static Widget _title(BuildContext context, String key, {Color? color}) =>
      BaseText(key, style: context.displayLarge, color: color);

  static Widget get _loginButton =>
      SelectorHelper<bool, LoginViewModel>().builder(
        (_, LoginViewModel model) => model.canLogin,
        (BuildContext context, bool canLogin, _) {
          final LoginViewModel model = context.read<LoginViewModel>();
          return ActionButton(
            key: model.actionButtonKey,
            text: TextKeys.login,
            padding: EdgeInsets.symmetric(
                horizontal: context.responsiveSize * 2.8,
                vertical: context.responsiveSize * 1.4),
            capitalizeAll: true,
            isActive: canLogin,
            onPressedError: model.login,
          );
        },
      );

  static Widget _createNewAccount(BuildContext context) => BaseText(
        TextKeys.createNewAccount,
        style: context.bodySmall,
        replaceValues: <ReplaceValue>[
          ReplaceValue(
            TextKeys.signup,
            onClick: () async => NavigationManager.instance
                .navigateToPage(path: NavigationConstants.signup),
            color: context.primary,
          )
        ],
      );
}
