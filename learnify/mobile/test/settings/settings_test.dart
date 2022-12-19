import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/features/settings/view/components/settings_item.dart';
import 'package:learnify/features/settings/view/settings_screen.dart';

import '../test_helpers.dart';

void main() {
  testWidgets(
    "Test Settings Screen.",
    (WidgetTester tester) async {
      const SettingsScreen settingsScreen = SettingsScreen();
      await tester.pumpWidget(TestHelpers.appWidget(settingsScreen));

      final Finder itemFinder =
          TestHelpers.descendantFinder(settingsScreen, SettingsItem);
      expect(itemFinder, findsWidgets);

      final List<Widget> settingsItems = tester.widgetList(itemFinder).toList();
      print(settingsItems);
    },
  );
}
