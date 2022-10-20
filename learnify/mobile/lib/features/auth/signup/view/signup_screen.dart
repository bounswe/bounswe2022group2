import 'package:flutter/material.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/signup_view_model.dart';

class SignupScreen extends BaseView<SignupViewModel> {
  const SignupScreen({Key? key}) : super(key: key, builder: _builder);

  static Widget _builder(BuildContext context) =>
      const Center(child: Text('SIGNUP'));
}
