import 'package:flutter/material.dart';

import '../../../product/language/language_keys.dart';

/// Represents the settings options.
enum SettingsOptions {
  theme,

  language,

  appInfo,

  socialInfo,
}

/// Extensions on [SettingsOptions].
extension StringSettingsValues on SettingsOptions {
  /// Returns the title of the settings option.
  String get title {
    switch (this) {
      case SettingsOptions.language:
        return TextKeys.language;
      case SettingsOptions.theme:
        return TextKeys.theme;
      case SettingsOptions.appInfo:
        return TextKeys.appInfo;
      case SettingsOptions.socialInfo:
        return TextKeys.socialInfo;
    }
  }

  /// Returns the subtitle of the settings option.
  String get subtitle {
    switch (this) {
      case SettingsOptions.language:
        return TextKeys.languageSubtitle;
      case SettingsOptions.theme:
        return TextKeys.themeSubtitle;
      case SettingsOptions.appInfo:
        return TextKeys.appInfoSubtitle;
      case SettingsOptions.socialInfo:
        return TextKeys.socialInfoSubtitle;
    }
  }

  /// Returns the corresponding icon for the settings option.
  IconData get icon {
    switch (this) {
      case SettingsOptions.language:
        return Icons.language_outlined;
      case SettingsOptions.theme:
        return Icons.color_lens_outlined;
      case SettingsOptions.appInfo:
        return Icons.info_outline;
      case SettingsOptions.socialInfo:
        return Icons.contact_mail_outlined;
    }
  }
}
