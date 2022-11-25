import 'package:flutter/material.dart';

import 'general_theme.dart';

mixin LightAppTheme {
  static const Color orange = Color(0xffFF731D);
  static const Color cream = Color(0xffFFF7E9);
  static const Color lightBlue = Color(0xff5F9DF7);
  static const Color darkBlue = Color(0xff1746A2);
  static const Color darkActiveColor = Colors.black87;
  static const Color lightActiveColor = Colors.white;
  static final Color? errorColor = Colors.red[400];

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        primaryColor: lightBlue,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey[100],
        inputDecorationTheme: GeneralTheme.inputDeco(
            activeColor: darkActiveColor,
            errorColor: errorColor,
            focusColor: lightBlue,
            inactiveColor: lightActiveColor),
        buttonTheme: GeneralTheme.buttonTheme(lightBlue),
        textButtonTheme: GeneralTheme.textButtonTheme(lightBlue),
        dividerTheme: GeneralTheme.dividerTheme(lightBlue),
        progressIndicatorTheme: GeneralTheme.progressIndicatorTheme(lightBlue),
        textTheme: GeneralTheme.textTheme(darkActiveColor),
        cardColor: lightBlue,
        cardTheme: CardTheme(shape: Border.all(color: darkBlue), elevation: 3),
        switchTheme: GeneralTheme.switchThemeData(lightBlue),
        tabBarTheme: GeneralTheme.tabBarTheme(lightBlue),
        textSelectionTheme: GeneralTheme.textSelectionTheme(lightBlue),
        scrollbarTheme: GeneralTheme.scrollBarThemeData(lightBlue),
        hoverColor: lightBlue.withOpacity(.3),
        indicatorColor: lightBlue,
        appBarTheme: const AppBarTheme(backgroundColor: lightBlue),
        colorScheme:
            const ColorScheme.light(primary: lightBlue, secondary: orange),
      );
}
