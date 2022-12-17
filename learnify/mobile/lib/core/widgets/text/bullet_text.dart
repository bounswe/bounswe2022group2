import 'package:flutter/material.dart';

import 'base_text.dart';

/// Colored text for an element of an unoredered list.
class BulletText extends BaseText {
  /// Default constructor for [BulletText].
  const BulletText(
    String text, {
    Color? color,
    TextStyle? style,
    bool translate = false,
    TextAlign textAlign = TextAlign.center,
    Key? key,
  }) : super(
          '\u2022 $text',
          color: color,
          style: style,
          translated: translate,
          textAlign: textAlign,
          key: key,
        );
}
