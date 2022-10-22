import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/widgets/buttons/action_button.dart';
import '../../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../../core/widgets/text-field/obscured_text_form_field.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../product/constants/icon_keys.dart';
import '../../../../product/language/language_keys.dart';
import '../view-model/signup_view_model.dart';

part './components/signup_form.dart';

class SignupScreen extends BaseView<SignupViewModel> {
  const SignupScreen({Key? key}) : super(builder: _builder, key: key);
  static Widget _builder(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(IconKeys.logo,
                width: context.width * 33, color: context.primary),
            context.sizedH(2),
            _title(context, TextKeys.signupTo),
            context.sizedH(.2),
            _title(context, TextKeys.learnify, color: context.primary),
            context.sizedH(2),
            const _SignupForm(),
            _signupButton(context),
          ],
        ),
      );

  static Widget _title(BuildContext context, String key, {Color? color}) =>
      BaseText(key, style: context.displayLarge, color: color);

  static Widget _signupButton(BuildContext context) => ActionButton(
        text: TextKeys.signup,
        capitalizeAll: true,
        onPressedError: () async => null,
      );
}
