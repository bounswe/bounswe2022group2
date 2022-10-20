import 'package:flutter/material.dart';

import '../../constants/enums/app_themes.dart';

/// Provider of theme, manages theme actions.
class ThemeProvider extends ChangeNotifier {
  ThemeData? _theme;
  AppThemes _themeEnum = AppThemes.light;

  /// Gets the value of current theme as [AppThemes] enum.
  AppThemes get currentThemeEnum => _themeEnum;

  /// Gets the current theme as [ThemeData].
  ThemeData get currentTheme {
    // TODO: Fix
    // if (_theme == null) _getStoredTheme();
    return _theme!;
  }

  // TODO: Fix
  // void _getStoredTheme() { }

  void _assignTheme(AppThemes themeEnum) {
    // TODO: Fix
    // if (themeEnum == AppThemes.dark) {
    //   _theme = DarkTheme().createTheme;
    // } else if (themeEnum == AppThemes.light) {
    //   _theme = LightTheme().createTheme;
    // }
  }

  /// Sets the current theme to the given one.
  Future<void> setTheme(AppThemes themeEnum) async {
    _assignTheme(themeEnum);
    _themeEnum = themeEnum;
    // TODO: Fix
    // await SettingsLocalManager.instance
    //     .set(SettingsOptions.theme, _themeEnum.name);
    notifyListeners();
  }

  /// Switches between the light-dark themes.
  Future<void> switchTheme() async {
    if (_themeEnum == AppThemes.light) {
      await setTheme(AppThemes.dark);
    } else if (_themeEnum == AppThemes.dark) {
      await setTheme(AppThemes.light);
    }
  }

  /// Returns a bool that represents whether the current theme is dark.
  bool get isDark => _themeEnum == AppThemes.dark;
}
