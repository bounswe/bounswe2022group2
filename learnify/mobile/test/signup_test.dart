import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/checkbox/custom_checkbox_tile.dart';
import 'package:learnify/core/widgets/text-field/custom_text_form_field.dart';
import 'package:learnify/core/widgets/text-field/obscured_text_form_field.dart';
import 'package:learnify/features/auth/signup/constants/widget_keys.dart';
import 'package:learnify/features/auth/signup/view/signup_screen.dart';

import 'test_helpers.dart';

void main() {
  testWidgets(
    "Test signup when invalid email/username/password is provided.",
    (WidgetTester tester) async {
      const SignupScreen signupScreen = SignupScreen();
      await tester.pumpWidget(TestHelpers.appWidget(signupScreen));

      final Finder buttonFinder = find.byType(ActionButton);
      expect(buttonFinder, findsOneWidget);
      ActionButton actionButton = tester.widget(buttonFinder) as ActionButton;

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

      emailField.controller?.text = 'hasan@gmail.com';
      usernameField.controller?.text = 'hasan';
      passwordField.controller.text = 'Hasan';
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), false);

      emailField.controller?.text = 'hasanarr@gmail.com';
      usernameField.controller?.text = 'hasanarisan';
      passwordField.controller.text = 'Hasan123';
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), true);
      actionButton = tester.widget(buttonFinder) as ActionButton;
      expect(actionButton.isActive, false);

      final Finder checkboxFinder = find.byKey(SignupKeys.privacyCheckbox);
      expect(checkboxFinder, findsOneWidget);

      final CustomCheckboxTile checkbox =
          tester.widget(checkboxFinder) as CustomCheckboxTile;
      checkbox.onTap(true);
      await tester.pumpAndSettle();

      actionButton = tester.widget(buttonFinder) as ActionButton;
      expect(actionButton.isActive, true);
    },
  );
}
