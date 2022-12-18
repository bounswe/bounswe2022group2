import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/extensions/string/string_extensions.dart';
import '../../../../core/providers/language/language_provider.dart';
import '../../../../core/providers/theme/theme_provider.dart';
import '../../../../core/widgets/base-icon/base_icon.dart';
import '../../../../core/widgets/buttons/custom_pop_menu_button.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../core/widgets/text/colored/colored_bullet_text.dart';
import '../../../../product/language/language_keys.dart';
import '../../../../product/language/language_options.dart';
import '../../../../product/theme/theme_types.dart';
import '../../constants/settings_constants.dart';
import '../../constants/settings_options.dart';
import 'social_account.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({required this.settings, Key? key}) : super(key: key);
  final SettingsOptions settings;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          highlightColor: context.primary.withOpacity(.15),
          hoverColor: context.primary,
        ),
        child: ListTileTheme(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 0,
          minVerticalPadding: 0,
          dense: true,
          child: _expansionTile(context),
        ),
      );

  Widget _expansionTile(BuildContext context) => ExpansionTile(
        collapsedTextColor: context.inactiveTextColor,
        collapsedIconColor: context.inactiveTextColor,
        tilePadding: EdgeInsets.symmetric(horizontal: context.width * 3),
        childrenPadding: EdgeInsets.symmetric(horizontal: context.width * 4)
            .copyWith(bottom: context.height * 1.7),
        leading: BaseIcon(context, settings.icon),
        title: _title(context),
        subtitle: _subtitle(context),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        expandedAlignment: Alignment.centerLeft,
        children: _children(context),
      );

  List<Widget> _children(BuildContext context) {
    switch (settings) {
      case SettingsOptions.language:
        return <Widget>[_languageRow(context)];
      case SettingsOptions.theme:
        return <Widget>[_themeRow(context)];
      case SettingsOptions.appInfo:
        return _infoTexts(context);
      case SettingsOptions.socialInfo:
        return <Widget>[const SocialAccounts()];
      default:
        return <Widget>[];
    }
  }

  Widget _languageRow(BuildContext context) {
    const List<LanguageOptions> langValues = LanguageOptions.values;
    final LanguageOptions selectedLang =
        context.read<LanguageProvider>().language;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BaseText(TextKeys.selectedLanguage, style: context.bodySmall),
        PopMenuButton(
          values: List<String>.generate(
              langValues.length, (int i) => langValues[i].languageName),
          width: context.width * 30,
          translated: false,
          selectedValue: selectedLang.languageName,
          icon: _langIconPath(selectedLang.name),
          icons: List<String>.generate(
              langValues.length, (int i) => _langIconPath(langValues[i].name)),
          padding: EdgeInsets.symmetric(
              horizontal: context.responsiveSize,
              vertical: context.responsiveSize * .2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: context.textColor, width: .7)),
          onTap: (String val) => context.read<LanguageProvider>().setLanguage(
              langValues.firstWhere((LanguageOptions e) =>
                  e.languageName.compareWithoutCase(val))),
        ),
      ],
    );
  }

  Widget _themeRow(BuildContext context) {
    final ThemeProvider themeProv = context.read<ThemeProvider>();
    final ThemeTypes selectedTheme = themeProv.currentThemeEnum;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BaseText(TextKeys.darkMode, style: context.bodySmall),
        FlutterSwitch(
          width: context.width * 19,
          height: context.height * 4.2,
          valueFontSize: context.width * 3.8,
          toggleSize: context.width * 6.5,
          value: selectedTheme == ThemeTypes.dark,
          borderRadius: 25,
          padding: context.width * 2,
          showOnOff: true,
          activeIcon:
              BaseIcon(context, Icons.dark_mode_outlined, color: Colors.black),
          inactiveIcon:
              BaseIcon(context, Icons.light_mode_outlined, color: Colors.black),
          activeText: context.tr(TextKeys.on),
          inactiveText: context.tr(TextKeys.off),
          onToggle: (bool val) =>
              themeProv.setTheme(val ? ThemeTypes.dark : ThemeTypes.light),
        ),
      ],
    );
  }

  String _langIconPath(String lang) => 'assets/flags/$lang.png';

  List<Widget> _infoTexts(BuildContext context) => List<Padding>.generate(
        SettingsTexts.infoSentences.keys.length,
        (int i) {
          final List<String> coloredTexts =
              SettingsTexts.infoSentences.values.elementAt(i);
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: context.width * 2),
            child: BulletColoredText(
              text: context.tr(SettingsTexts.infoSentences.keys.elementAt(i)),
              coloredTexts: List<String>.generate(coloredTexts.length,
                  (int index) => context.tr(coloredTexts[index])),
            ),
          );
        },
      );

  Widget _title(BuildContext context) => BaseText(
        settings.title,
        textAlign: TextAlign.start,
      );

  Widget _subtitle(BuildContext context) => BaseText(
        settings.subtitle,
        textAlign: TextAlign.start,
        style: context.labelMedium,
      );
}
