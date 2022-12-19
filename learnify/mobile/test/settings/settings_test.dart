import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learnify/core/extensions/string/string_extensions.dart';
import 'package:learnify/core/managers/local/local_manager.dart';
import 'package:learnify/core/widgets/buttons/custom_pop_menu_button.dart';
import 'package:learnify/core/widgets/text/base_text.dart';
import 'package:learnify/features/settings/constants/settings_options.dart';
import 'package:learnify/features/settings/view/components/settings_item.dart';
import 'package:learnify/features/settings/view/settings_screen.dart';
import 'package:learnify/product/constants/storage_keys.dart';
import 'package:learnify/product/language/language_keys.dart';
import 'package:learnify/product/theme/theme_types.dart';

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
      final ExpansionTile expansionTile =
          tester.widget(expansionTileFinder) as ExpansionTile;

      final Widget tileChild = expansionTile.children[0];
      expect(tileChild.runtimeType, Row);
      final Row switchRow = expansionTile.children[0] as Row;
      expect(switchRow.children[0].runtimeType, BaseText);
      expect(switchRow.children[1].runtimeType, FlutterSwitch);

      final BaseText themeText = switchRow.children[0] as BaseText;
      final FlutterSwitch themeSwitch = switchRow.children[1] as FlutterSwitch;

      final ThemeTypes? storedTheme = LocalManager.instance
          .getString(StorageKeys.theme)
          ?.toEnum<ThemeTypes>(ThemeTypes.values);
      expect(themeText.text, equals(TextKeys.darkMode));
      expect(themeSwitch.value, storedTheme == ThemeTypes.dark);

      final Finder expansionTileFinderLang =
          TestHelpers.descendantFinder(item2, ExpansionTile);
      expect(expansionTileFinderLang, findsOneWidget);
      final ExpansionTile expansionTile2 =
          tester.widget(expansionTileFinderLang) as ExpansionTile;

      final Widget tileChild2 = expansionTile2.children[0];
      expect(tileChild2.runtimeType, Row);
      final Row popMenuRow = expansionTile2.children[0] as Row;
      expect(popMenuRow.children[0].runtimeType, BaseText);
      expect(popMenuRow.children[1].runtimeType, PopMenuButton);

      final BaseText languageText = popMenuRow.children[0] as BaseText;
      final PopMenuButton languageButton =
          popMenuRow.children[1] as PopMenuButton;
    },
  );
}
