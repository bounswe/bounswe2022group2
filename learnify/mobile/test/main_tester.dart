import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/providers/provider_list.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/checkbox/custom_checkbox_tile.dart';
import 'package:learnify/core/widgets/text-field/custom_text_form_field.dart';
import 'package:learnify/core/widgets/text-field/obscured_text_form_field.dart';
import 'package:learnify/features/auth/signup/constants/widget_keys.dart';
import 'package:learnify/features/auth/signup/view/signup_screen.dart';
import 'package:provider/provider.dart';

part 'app_pumper.dart';
part 'signup_tester.dart';

Future<void> main() async {
  _signupTester();
}
