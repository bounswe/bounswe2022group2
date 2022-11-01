import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../product/theme/light_theme.dart';
import '../../providers/theme/theme_provider.dart';

/// Extensions for theme related data with context.
extension ColorExtensions on BuildContext {
  ThemeData get _theme => watch<ThemeProvider>().currentTheme;
  TextTheme get _textTheme => _theme.textTheme;

  Color get errorColor => _theme.errorColor;
  Color get primary => _theme.colorScheme.primary;
  Color get secondary => _theme.colorScheme.secondary;
  Color get primaryLight => _theme.primaryColorLight;
  Color get primaryDark => _theme.primaryColorDark;
  Color get textColor => _textTheme.bodyMedium?.color ?? Colors.white;
  Color get inactiveTextColor =>
      _textTheme.labelSmall?.color ?? Colors.white.withOpacity(.8);
  Color get lightActiveColor => LightAppTheme.lightActiveColor;
  Color get darkActiveColor => LightAppTheme.darkActiveColor;
  Color get activeColor =>
      watch<ThemeProvider>().isDark ? lightActiveColor : darkActiveColor;

  TextStyle get labelSmall => _textTheme.labelSmall ?? _defaultStyle;
  TextStyle get labelMedium => _textTheme.labelMedium ?? _defaultStyle;
  TextStyle get labelLarge => _textTheme.labelLarge ?? _defaultStyle;
  TextStyle get bodySmall => _textTheme.bodySmall ?? _defaultStyle;
  TextStyle get bodyMedium => _textTheme.bodyMedium ?? _defaultStyle;
  TextStyle get bodyLarge => _textTheme.bodyLarge ?? _defaultStyle;
  TextStyle get titleSmall => _textTheme.titleSmall ?? _defaultStyle;
  TextStyle get titleMedium => _textTheme.titleMedium ?? _defaultStyle;
  TextStyle get titleLarge => _textTheme.titleLarge ?? _defaultStyle;
  TextStyle get displaySmall => _textTheme.displaySmall ?? _defaultStyle;
  TextStyle get displayMedium => _textTheme.displayMedium ?? _defaultStyle;
  TextStyle get displayLarge => _textTheme.displayLarge ?? _defaultStyle;

  TextStyle get _defaultStyle => const TextStyle();
}
