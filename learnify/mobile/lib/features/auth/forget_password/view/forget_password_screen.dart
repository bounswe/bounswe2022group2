import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/helpers/selector_helper.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/widgets/buttons/action_button.dart';
import '../../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../product/constants/icon_keys.dart';
import '../../../../product/language/language_keys.dart';
import '../constants/widget_keys.dart';
import '../view-model/forget_password_view_model.dart';

part './components/email_form.dart';

class ForgetPasswordScreen extends BaseView<ForgetPasswordViewModel> {
  const ForgetPasswordScreen({Key? key})
      : super(builder: _builder, scrollable: true, key: key);
  static Widget _builder(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(IconKeys.logo,
              width: context.width * 33, color: context.primary),
          context.sizedH(4),
          _title(context, TextKeys.forgetPassword),
          context.sizedH(4),
          const _EmailForm(),
          context.sizedH(2),
          _verifyButton,
        ],
      );

  static Widget _title(BuildContext context, String key, {Color? color}) =>
      BaseText(key, style: context.displayLarge, color: color);

  static Widget get _verifyButton =>
      SelectorHelper<bool, ForgetPasswordViewModel>().builder(
          (_, ForgetPasswordViewModel model) => model.canVerify,
          (BuildContext context, bool canVerify, _) => ActionButton(
                key: ForgetPasswordKeys.actionButton,
                text: TextKeys.verifyEmail,
                padding: EdgeInsets.symmetric(
                    horizontal: context.responsiveSize * 2.8,
                    vertical: context.responsiveSize * 1.4),
                capitalizeAll: true,
                isActive: canVerify,
                onPressedError:
                    context.read<ForgetPasswordViewModel>().forgetPassword,
              ));
}
