import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/features/settings/constants/settings_options.dart';
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
      expect(settingsItems.length, equals(4));

      final SettingsItem firstItem = settingsItems[0] as SettingsItem;
      expect(firstItem.settings, equals(SettingsOptions.theme));
      final SettingsItem item2 = settingsItems[1] as SettingsItem;
      expect(item2.settings, equals(SettingsOptions.language));
      final SettingsItem item3 = settingsItems[2] as SettingsItem;
      expect(item3.settings, equals(SettingsOptions.appInfo));
      final SettingsItem lastItem = settingsItems[3] as SettingsItem;
      expect(lastItem.settings, equals(SettingsOptions.socialInfo));

      final Finder expansionTileFinder =
          TestHelpers.descendantFinder(firstItem, ExpansionTile);
      expect(expansionTileFinder, findsOneWidget);
    },
  );
}
