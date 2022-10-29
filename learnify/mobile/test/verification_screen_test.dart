import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/widgets/buttons/action_button.dart';
import 'package:learnify/features/auth/verification/constants/widget_keys.dart';
import 'package:learnify/features/auth/verification/view/verification_screen.dart';

import 'test_helpers.dart';

void main() {
  testWidgets("Test verification screen", (WidgetTester tester) async {
    final VerificationScreen verificationScreen =
        VerificationScreen(email: "aizheng@gmail.com");
    await tester.pumpWidget(TestHelpers.appWidget(verificationScreen));

    final Finder buttonFinder = find.byType(ActionButton);
    expect(buttonFinder, findsOneWidget);
    ActionButton actionButton = tester.widget(buttonFinder) as ActionButton;

    final Finder verificationCodeFirstDigitFinder =
        find.byKey(VerificationKeys.verificationCodeFirstDigitField);
    expect(verificationCodeFirstDigitFinder, findsOneWidget);
    final SizedBox verificationCodeFirstDigitFieldBox =
        tester.widget(verificationCodeFirstDigitFinder) as SizedBox;
    final TextFormField verificationCodeFirstDigitField =
        // ignore: cast_nullable_to_non_nullable
        verificationCodeFirstDigitFieldBox.child as TextFormField;

    final Finder verificationCodeSecondDigitFinder =
        find.byKey(VerificationKeys.verificationCodeSecondDigitField);
    expect(verificationCodeSecondDigitFinder, findsOneWidget);
    final SizedBox verificationCodeSecondDigitFieldBox =
        tester.widget(verificationCodeSecondDigitFinder) as SizedBox;
    final TextFormField verificationCodeSecondDigitField =
        // ignore: cast_nullable_to_non_nullable
        verificationCodeSecondDigitFieldBox.child as TextFormField;

    final Finder verificationCodeThirdDigitFinder =
        find.byKey(VerificationKeys.verificationCodeThirdDigitField);
    expect(verificationCodeThirdDigitFinder, findsOneWidget);
    final SizedBox verificationCodeThirdDigitFieldBox =
        tester.widget(verificationCodeThirdDigitFinder) as SizedBox;
    final TextFormField verificationCodeThirdDigitField =
        // ignore: cast_nullable_to_non_nullable
        verificationCodeThirdDigitFieldBox.child as TextFormField;

    final Finder verificationCodeFourthDigitFinder =
        find.byKey(VerificationKeys.verificationCodeFourthDigitField);
    expect(verificationCodeFourthDigitFinder, findsOneWidget);
    final SizedBox verificationCodeFourthDigitFieldBox =
        tester.widget(verificationCodeFourthDigitFinder) as SizedBox;
    final TextFormField verificationCodeFourthDigitField =
        // ignore: cast_nullable_to_non_nullable
        verificationCodeFourthDigitFieldBox.child as TextFormField;

    final Finder verificationCodeTimerFinder =
        find.byType(VerificationCodeTimer);
    expect(verificationCodeTimerFinder, findsOneWidget);

    verificationCodeFirstDigitField.controller?.text = "1";
    verificationCodeSecondDigitField.controller?.text = "2";
    verificationCodeThirdDigitField.controller?.text = "3";
    await tester.pumpAndSettle();
    actionButton = tester.widget(buttonFinder) as ActionButton;
    expect(actionButton.isActive, false);

    verificationCodeSecondDigitField.controller?.text = "";
    verificationCodeThirdDigitField.controller?.text = "";
    verificationCodeFourthDigitField.controller?.text = "4";
    await tester.pumpAndSettle();
    actionButton = tester.widget(buttonFinder) as ActionButton;
    expect(actionButton.isActive, false);

    verificationCodeSecondDigitField.controller?.text = "2";
    verificationCodeThirdDigitField.controller?.text = "3";
    await tester.pumpAndSettle();
    actionButton = tester.widget(buttonFinder) as ActionButton;
    expect(actionButton.isActive, true);
  });
}
