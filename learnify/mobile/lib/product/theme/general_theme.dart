import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'light_theme.dart';

mixin GeneralTheme {
  static ScrollbarThemeData scrollBarThemeData(Color? color) =>
      ScrollbarThemeData(
        thumbColor: all<Color?>(color),
        thickness: all<double>(4.5),
        trackVisibility: all(true),
        crossAxisMargin: 0,
      );

  static TextSelectionThemeData textSelectionTheme(Color cursorColor) =>
      TextSelectionThemeData(cursorColor: cursorColor);

  static TabBarTheme tabBarTheme(Color? borderColor) => TabBarTheme(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: borderColor ?? LightAppTheme.orange),
          ),
        ),
      );

  static SwitchThemeData switchThemeData(Color? color) => SwitchThemeData(
        thumbColor: all(color),
        overlayColor: all(color ?? LightAppTheme.orange),
        trackColor: all(color ?? LightAppTheme.orange),
        splashRadius: 0,
      );

  static ProgressIndicatorThemeData progressIndicatorTheme(Color? color) =>
      ProgressIndicatorThemeData(color: color, linearMinHeight: 10);

  static DividerThemeData dividerTheme(Color? color) =>
      DividerThemeData(thickness: 2.2, color: color);

  static InputDecorationTheme inputDeco({
    Color? inactiveColor,
    Color? fillColor,
    Color? errorColor,
    Color? focusColor,
    Color? activeColor,
  }) =>
      InputDecorationTheme(
        fillColor: fillColor,
        disabledBorder: _border(inactiveColor),
        enabledBorder: _border(activeColor),
        errorBorder: _border(errorColor),
        focusedBorder: _border(focusColor, width: 1.1),
        focusedErrorBorder: _border(errorColor, width: 1.1),
        errorMaxLines: 1,
        filled: true,
      );

  static OutlineInputBorder _border(Color? color, {double? width}) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(23)),
        borderSide:
            BorderSide(color: color ?? LightAppTheme.orange, width: width ?? 1),
      );

  static ButtonThemeData buttonTheme(Color? inactiveColor) =>
      ButtonThemeData(disabledColor: inactiveColor);

  static TextButtonThemeData textButtonTheme(Color? color) =>
      TextButtonThemeData(
        style: ButtonStyle(
          textStyle: all<TextStyle?>(TextStyle(color: color)),
        ),
      );

  static TextTheme textTheme(Color? color) {
    final Color? largeColor = color;
    final Color? smallColor = color?.withOpacity(.8);
    return TextTheme(
      displayLarge: GoogleFonts.raleway(color: largeColor, fontSize: 30),
      displayMedium: GoogleFonts.raleway(color: largeColor, fontSize: 26),
      displaySmall: GoogleFonts.raleway(color: largeColor, fontSize: 22),
      titleLarge: GoogleFonts.raleway(color: largeColor, fontSize: 18),
      titleMedium: GoogleFonts.openSans(color: largeColor, fontSize: 17),
      titleSmall: GoogleFonts.openSans(color: largeColor, fontSize: 16),
      bodyLarge: GoogleFonts.openSans(color: largeColor, fontSize: 15),
      bodyMedium: GoogleFonts.openSans(color: largeColor, fontSize: 14),
      bodySmall: GoogleFonts.openSans(color: smallColor, fontSize: 13),
      labelLarge: GoogleFonts.openSans(color: smallColor, fontSize: 12),
      labelMedium: GoogleFonts.openSans(color: smallColor, fontSize: 11),
      labelSmall: GoogleFonts.openSans(color: smallColor, fontSize: 10),
    );
  }

  /// Returns the corresponding all material state property for given value.
  static MaterialStateProperty<T> all<T>(T value) =>
      MaterialStateProperty.all(value);
}
