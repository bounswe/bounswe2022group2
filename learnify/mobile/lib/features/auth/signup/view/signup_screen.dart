import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/signup_view_model.dart';

part './components/signup_form.dart';

class SignupScreen extends BaseView<SignupViewModel> {
  const SignupScreen({Key? key}) : super(builder: _builder, key: key);
  static Widget _builder(BuildContext context) => Center(
        child: Column(
          children: [
            TextFormField(
                controller: context.read<SignupViewModel>().emailController),
            TextButton(
              onPressed: context.read<SignupViewModel>().haveAccount,
              child: const Text('PRESS'),
            )
          ],
        ),
      );
}
