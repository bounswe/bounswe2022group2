import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/core/widgets/text-field/custom_text_form_field.dart';
import 'package:learnify/features/home-wrapper/view/home_wrapper_screen.dart';
import 'package:learnify/features/profile/constants/widget_keys.dart';

import 'app_pumper.dart';

void main() {
  testWidgets(
    "Tests profile screen when an invalid username is entered.",
    (WidgetTester tester) async {
      final HomeWrapper homeWrapper = HomeWrapper(initialIndex: 3);
      await tester.pumpWidget(appWidget(homeWrapper));

      final Finder buttonFinder = find.byType(ActionButton);
      expect(buttonFinder, findsOneWidget);
      ActionButton actionButton = tester.widget(buttonFinder) as ActionButton;

      final Finder formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget);
      final Form form = tester.widget(formFinder) as Form;

      final GlobalKey<FormState>? formKey = form.key as GlobalKey<FormState>?;
      expect(actionButton.isActive, false);
      expect(formKey?.currentState?.validate(), false);

      final Finder usernameFinder = find.byKey(ProfileKeys.usernameField);
      expect(usernameFinder, findsOneWidget);
      final CustomTextFormField usernameField =
          tester.widget(usernameFinder) as CustomTextFormField;
      usernameField.controller?.text = 'ex';
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), false);

      usernameField.controller?.text = 'hasanarisan';
      await tester.pumpAndSettle();
      expect(formKey?.currentState?.validate(), true);

      actionButton = tester.widget(buttonFinder) as ActionButton;
      expect(actionButton.isActive, true);
    },
  );
}
