import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/widgets/text-field/custom_text_form_field.dart';
import '../../../../product/language/language_keys.dart';
import '../view-model/signup_view_model.dart';

part './components/signup_form.dart';

class SignupScreen extends BaseView<SignupViewModel> {
  const SignupScreen({Key? key}) : super(builder: _builder, key: key);
  static Widget _builder(BuildContext context) => Center(
        child: Column(
          children: const <Widget>[
            _SignupForm(),
          ],
        ),
      );
}
