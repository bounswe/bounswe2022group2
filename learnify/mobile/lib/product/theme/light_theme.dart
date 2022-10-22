import 'package:flutter/material.dart';

import 'general_theme.dart';

mixin LightAppTheme {
  static const Color orange = Color(0xffFF731D);
  static const Color cream = Color(0xffFFF7E9);
  static const Color lightBlue = Color(0xff5F9DF7);
  static const Color darkBlue = Color(0xff1746A2);

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        primaryColor: orange,
        brightness: Brightness.dark,
        inputDecorationTheme: GeneralTheme.inputDeco(),
        buttonTheme: GeneralTheme.buttonTheme(orange),
        textButtonTheme: GeneralTheme.textButtonTheme(orange),
        dividerTheme: GeneralTheme.dividerTheme(orange),
        progressIndicatorTheme: GeneralTheme.progressIndicatorTheme(orange),
        cardColor: orange,
        cardTheme: CardTheme(shape: Border.all(color: lightBlue), elevation: 3),
        switchTheme: GeneralTheme.switchThemeData(orange),
        tabBarTheme: GeneralTheme.tabBarTheme(orange),
        textSelectionTheme: GeneralTheme.textSelectionTheme(orange),
        scrollbarTheme: GeneralTheme.scrollBarThemeData(orange),
        hoverColor: orange.withOpacity(.3),
        indicatorColor: orange,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black87),
        colorScheme:
            const ColorScheme.light(primary: orange, secondary: lightBlue),
      );
}
