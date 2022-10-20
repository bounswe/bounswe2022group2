import 'package:flutter/material.dart';

mixin LightAppTheme {
  static const Color orange = Color(0xffFF731D);
  static const Color cream = Color(0xffFFF7E9);
  static const Color lightBlue = Color(0xff5F9DF7);
  static const Color darkBlue = Color(0xff1746A2);

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        primaryColor: orange,
        colorScheme:
            const ColorScheme.light(primary: orange, secondary: lightBlue),
      );
}
