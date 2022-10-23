import 'package:flutter/material.dart';

/// Text style decoration extensions.
extension TextStyleDecorations on TextStyle {
  /// Underlines the text with a custom style.
  TextStyle underline({double thickness = 1.5, double yOffset = -3}) {
    final Color mainColor = color ?? Colors.black;
    return copyWith(
      shadows: <Shadow>[Shadow(color: mainColor, offset: Offset(0, yOffset))],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationColor: mainColor,
      decorationThickness: thickness,
    );
  }
}

/// Text align extensions.
extension TextAlignExtensions on TextAlign {
  /// Returns corresponding [Alignment] for [TextAlign].
  Alignment get alignment {
    switch (this) {
      case TextAlign.start:
        return Alignment.centerLeft;
      case TextAlign.end:
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }
}
