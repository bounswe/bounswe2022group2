import 'package:flutter/material.dart';

import 'general_theme.dart';

mixin DarkAppTheme {
  static const Color orange = Color(0xffFF731D);
  static const Color cream = Color(0xffFFF7E9);
  static const Color lightBlue = Color(0xff5F9DF7);
  static const Color darkBlue = Color(0xff1746A2);
  static const Color darkActiveColor = Colors.black87;
  static const Color lightActiveColor = Colors.white70;
  static final Color? errorColor = Colors.red[600];

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        primaryColor: orange,
        brightness: Brightness.dark,
        inputDecorationTheme: GeneralTheme.inputDeco(
            activeColor: lightActiveColor,
            errorColor: errorColor,
            focusColor: orange,
            inactiveColor: darkActiveColor),
        buttonTheme: GeneralTheme.buttonTheme(orange),
        textButtonTheme: GeneralTheme.textButtonTheme(orange),
        dividerTheme: GeneralTheme.dividerTheme(orange),
        progressIndicatorTheme: GeneralTheme.progressIndicatorTheme(orange),
        textTheme: GeneralTheme.textTheme(lightActiveColor),
        cardColor: orange,
        cardTheme: CardTheme(shape: Border.all(color: darkBlue), elevation: 3),
        switchTheme: GeneralTheme.switchThemeData(orange),
        tabBarTheme: GeneralTheme.tabBarTheme(orange),
        textSelectionTheme: GeneralTheme.textSelectionTheme(orange),
        scrollbarTheme: GeneralTheme.scrollBarThemeData(orange),
        hoverColor: orange.withOpacity(.3),
        indicatorColor: orange,
        appBarTheme: const AppBarTheme(backgroundColor: orange),
        colorScheme:
            const ColorScheme.dark(primary: orange, secondary: darkBlue),
      );
}
