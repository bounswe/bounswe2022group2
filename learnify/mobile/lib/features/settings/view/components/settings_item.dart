import 'package:flutter/material.dart';

import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/widgets/base-icon/base_icon.dart';
import '../../../../core/widgets/buttons/custom_pop_menu_button.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../../../core/widgets/text/colored/colored_bullet_text.dart';
import '../../../../product/language/language_keys.dart';
import '../../../../product/language/language_options.dart';
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
    const List<LanguageOptions> langValues = LanguageOptions.values;
    switch (settings) {
      case SettingsOptions.language:
        return <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              BaseText(TextKeys.selectedLanguage, style: context.bodySmall),
              PopMenuButton(
                values: List<String>.generate(
                    langValues.length, (int i) => langValues[i].languageName),
                width: context.width * 30,
                translated: false,
                // TODO: Fix
                selectedValue: 'Türkçe',
                icon: _langIconPath(langValues[0].name),
                icons: List<String>.generate(langValues.length,
                    (int i) => _langIconPath(langValues[i].name)),
                padding: EdgeInsets.symmetric(
                    horizontal: context.responsiveSize,
                    vertical: context.responsiveSize * .2),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: context.textColor, width: .7)),
                onTap: (String val) {},
              ),
            ],
          )
        ];
      case SettingsOptions.appInfo:
        return _infoTexts(context);
      case SettingsOptions.socialInfo:
        return <Widget>[const SocialAccounts()];
      default:
        return <Widget>[];
    }
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
