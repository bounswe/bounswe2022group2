import 'package:flutter/material.dart';

import '../../../../core/extensions/context/context_extensions.dart';
import '../../../../core/extensions/context/theme_extensions.dart';
import '../../../../core/helpers/url_launcher_helper.dart';
import '../../constants/settings_constants.dart';

class SocialAccounts extends StatelessWidget {
  const SocialAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
        children: List<Widget>.generate(
          SettingsTexts.socialMediaAccounts.length,
          (int i) => _item(i, context),
        ),
      );

  Widget _item(int i, BuildContext context) {
    final SocialMediaModel account = SettingsTexts.socialMediaAccounts[i];
    return Expanded(
      child: IconButton(
        padding: EdgeInsets.all(context.width * 3),
        onPressed: () async => UrlLauncherHelper.launch(account.link),
        icon: Image.asset('assets/images/${account.nameKey}.png',
            color:
                i == 2 ? (context.isDark ? Colors.white : Colors.black) : null),
        splashRadius: 25,
      ),
    );
  }
}
