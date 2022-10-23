import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/text-field/custom_text_form_field.dart';
import 'package:learnify/core/widgets/text-field/obscured_text_form_field.dart';
import 'package:learnify/features/auth/signup/constants/widget_keys.dart';
import 'package:learnify/features/auth/signup/view/signup_screen.dart';

import 'app_pumper.dart';

Future<void> main() async {
  testWidgets(
    "Test signup when invalid email/username/password is provided.",
    (WidgetTester tester) async {
      const SignupScreen signupScreen = SignupScreen();
      await tester.pumpWidget(appWidget(signupScreen));
      final Finder buttonFinder = find.byKey(SignupKeys.actionButton);
      expect(buttonFinder, findsOneWidget);
      final ActionButton actionButton =
          tester.widget(buttonFinder) as ActionButton;
      final Finder formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget);
      final Form form = tester.widget(formFinder) as Form;
      final GlobalKey<FormState>? formKey = form.key as GlobalKey<FormState>?;
      expect(actionButton.isActive, false);
      expect(formKey?.currentState?.validate(), false);
      final Finder emailFinder = find.byKey(SignupKeys.emailField);
      expect(emailFinder, findsOneWidget);
      final CustomTextFormField emailField =
          tester.widget(emailFinder) as CustomTextFormField;
      final Finder usernameFinder = find.byKey(SignupKeys.usernameField);
      expect(usernameFinder, findsOneWidget);
      final CustomTextFormField usernameField =
          tester.widget(usernameFinder) as CustomTextFormField;
      final Finder passwordFinder = find.byKey(SignupKeys.passwordField);
      expect(passwordFinder, findsOneWidget);
      final ObscuredTextFormField passwordField =
          tester.widget(passwordFinder) as ObscuredTextFormField;
      emailField.controller?.text = 'example@gmail.com';
      usernameField.controller?.text = 'example';
      passwordField.controller.text = 'NotValidPassword';
      expect(formKey?.currentState?.validate(), false);
      emailField.controller?.text = 'example@gmail.com';
      usernameField.controller?.text = 'example';
      passwordField.controller.text = 'Example123';
      expect(formKey?.currentState?.validate(), true);
      expect(actionButton.isActive, false);
    },
  );
}
