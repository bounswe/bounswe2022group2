import 'package:flutter/material.dart';

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
            bottom: BorderSide(color: borderColor ?? Colors.white),
          ),
        ),
      );

  static SwitchThemeData switchThemeData(Color? color) => SwitchThemeData(
        thumbColor: all(color),
        overlayColor: all(color ?? Colors.white),
        trackColor: all(color ?? Colors.white),
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
  }) =>
      InputDecorationTheme(
        fillColor: fillColor,
        disabledBorder: _border(inactiveColor),
        enabledBorder: _border(inactiveColor),
        errorBorder: _border(errorColor),
        focusedBorder: _border(focusColor, width: 1.1),
        focusedErrorBorder: _border(errorColor, width: 1.1),
        errorMaxLines: 1,
        filled: true,
      );

  static OutlineInputBorder _border(Color? color, {double? width}) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(23)),
        borderSide: BorderSide(color: color ?? Colors.black, width: width ?? 1),
      );

  static ButtonThemeData buttonTheme(Color? inactiveColor) =>
      ButtonThemeData(disabledColor: inactiveColor);

  static TextButtonThemeData textButtonTheme(Color? color) =>
      TextButtonThemeData(
        style: ButtonStyle(
          textStyle: all<TextStyle?>(TextStyle(color: color)),
        ),
      );

  /// Returns the corresponding all material state property for given value.
  static MaterialStateProperty<T> all<T>(T value) =>
      MaterialStateProperty.all(value);
}
