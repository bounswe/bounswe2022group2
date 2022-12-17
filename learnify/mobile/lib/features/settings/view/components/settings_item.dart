import 'package:flutter/material.dart';

import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/widgets/base-icon/base_icon.dart';
import '../../../../core/widgets/text/base_text.dart';
import '../../constants/settings_constants.dart';
import '../../constants/settings_options.dart';

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
        childrenPadding: EdgeInsets.symmetric(horizontal: context.width * 3)
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
      case SettingsOptions.appInfo:
        return _infoTexts(context);
      // case SettingsOptions.socialInfo:
      //   return <Widget>[const _SocialMedia()];
      default:
        return <Widget>[];
    }
  }

  List<Widget> _infoTexts(BuildContext context) => List<Padding>.generate(
        SettingsTexts.infoSentences.keys.length,
        (int i) => Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 2),
          // child: BulletColoredText(
          //   text: SettingsTexts.infoSentences.keys.elementAt(i),
          //   coloredTexts: SettingsTexts.infoSentences.values.elementAt(i),
          // ),
        ),
      );

  Widget _title(BuildContext context) => BaseText(
        settings.title,
        textAlign: TextAlign.start,
      );

  Widget _subtitle(BuildContext context) => BaseText(
        settings.subtitle,
        textAlign: TextAlign.start,
      );
}
