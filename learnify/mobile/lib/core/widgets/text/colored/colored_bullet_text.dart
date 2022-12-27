import 'package:flutter/material.dart';

import 'colored_text.dart';

/// Colored text for an element of an unoredered list.
class BulletColoredText extends ColoredText {
  /// Default constructor for [BulletColoredText].
  BulletColoredText({
    required String text,
    List<String> coloredTexts = const <String>[],
    Key? key,
  }) : super(
          text: '\u2022 $text',
          coloredTexts: <String>[...coloredTexts, '\u2022'],
          key: key,
        );
}
