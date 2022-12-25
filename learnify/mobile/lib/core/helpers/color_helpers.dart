import 'dart:math' as math;

import 'package:flutter/material.dart';

// Collection of helper methods for [Color]s.
mixin ColorHelpers {
  /// Returns a random color
  static Color get randomColor =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(.85);

  /// Returns a light random color.
  static Color get lightRandomColor {
    final List<String> letters = '9ABCDEF'.split('');
    final StringBuffer buffer = StringBuffer('0xff');
    for (int i = 0; i < 6; i++) {
      buffer.write(letters[(math.Random().nextInt(letters.length)).floor()]);
    }
    return Color(int.parse(buffer.toString()));
  }

  /// Returns a dark random color.
  static Color get darkRandomColor {
    final List<String> letters = '012345678'.split('');
    final StringBuffer buffer = StringBuffer('0xff');
    for (int i = 0; i < 6; i++) {
      buffer.write(letters[(math.Random().nextInt(letters.length)).floor()]);
    }
    return Color(int.parse(buffer.toString()));
  }
}
