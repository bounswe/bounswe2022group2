import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/main_type_definitions.dart';
import '../extensions/context/context_extensions.dart';
import '../extensions/context/theme_extensions.dart';
import '../extensions/string/string_extensions.dart';
import '../extensions/text-style/text_style_extensions.dart';
import '../widgets/text/base_text.dart';

/// Collection of helpers for text widgets.
class TextHelpers {
  /// Default constructor.
  TextHelpers(
    this.context, {
    this.style,
    this.color,
    this.underline = false,
    this.overflow,
    this.maxLines = 50000,
    this.fontWeight,
    this.capitalizeAllWords = false,
    this.onClick,
    this.textAlign,
    this.capitalizeAll = false,
    this.capitalize = false,
  }) {
    _defaultFont = context.bodyLarge;
  }

  /// Context to further customize.
  final BuildContext context;

  /// Custom optional style for text.
  final TextStyle? style;

  /// Custom color for the text.
  final Color? color;

  /// Determines whether to underline.
  final bool underline;

  /// Overflow behavior of the text.
  final TextOverflow? overflow;

  /// Maximum line number.
  final int? maxLines;

  /// Font weight.
  final FontWeight? fontWeight;

  /// Whether to capitalize all words.
  final bool capitalizeAllWords;

  /// On click callback.
  final AnyCallback? onClick;

  /// Alignment of the text.
  final TextAlign? textAlign;

  late final TextStyle _defaultFont;

  /// Determines whether to capitalize all characters.
  final bool capitalizeAll;

  /// Determines whether to capitalize first char.
  final bool capitalize;

  /// Returns the correct text for the given options.
  Widget normalText(
    String text, {
    bool translated = true,
    bool hyphenate = false,
    bool useCorrectEllipsis = false,
    int maxLength = 300000,
    Color? color,
  }) {
    final String normalizedText = _normalizedString(
      text,
      translated: translated,
      hyphenate: hyphenate,
      useCorrectEllipsis: useCorrectEllipsis,
      maxLength: maxLength,
    );
    return onClick == null
        ? Text(
            normalizedText,
            maxLines: maxLines,
            style: _style(context, color: color),
            textAlign: textAlign,
            overflow: overflow ?? TextOverflow.clip,
          )
        : _clickableText(normalizedText, onClick);
  }

  Widget _clickableText(String normalizedText, AnyCallback? onClick) =>
      RichText(
        text: TextSpan(
          style: _style(context, color: color),
          children: <TextSpan>[
            TextSpan(
              text: normalizedText,
              recognizer: TapGestureRecognizer()..onTap = onClick,
            ),
          ],
        ),
        textAlign: textAlign ?? TextAlign.start,
      );

  String _normalizedString(
    String text, {
    bool translated = true,
    bool hyphenate = false,
    bool useCorrectEllipsis = false,
    int maxLength = 300000,
  }) {
    final String correctText = translated ? context.tr(text) : text;
    String finalText = correctText.length > maxLength
        ? correctText.substring(0, maxLength)
        : correctText;
    if (capitalizeAllWords) finalText = finalText.capitalizeAllWords;
    if (capitalize) finalText = finalText.capitalize;
    return capitalizeAll ? finalText.toUpperCase() : finalText;
  }

  /// Returns the replaced text for the given replace values.
  Widget replacedText(String text, List<ReplaceValue> values,
      {bool translated = true, AnyCallback? onClick}) {
    final List<ReplaceValue> allValues =
        (translated ? context.tr(text) : text).putValues(values);
    return RichText(
      text: TextSpan(
        style: _style(context),
        children: List<TextSpan>.generate(allValues.length,
            (int i) => _textSpan(allValues[i], context, onClick)),
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }

  TextSpan _textSpan(
      ReplaceValue el, BuildContext context, AnyCallback? onClick) {
    final String text = el.translate ? context.tr(el.text) : el.text;
    return el.onClick == null && onClick == null
        ? TextSpan(
            text: capitalizeAll ? text.toUpperCase() : text,
            style: _style(context, color: el.color),
          )
        : TextSpan(
            text: capitalizeAll ? text.toUpperCase() : text,
            style: _style(context, color: el.color),
            recognizer: TapGestureRecognizer()..onTap = el.onClick ?? onClick,
          );
  }

  TextStyle _style(BuildContext context, {Color? color}) =>
      underline && onClick == null
          ? _defaultStyle(context, color).underline()
          : _defaultStyle(context, color);

  TextStyle _defaultStyle(BuildContext context, Color? extraColor) =>
      (color == null && extraColor == null)
          ? _baseStyle(context).merge(style).copyWith(
              fontWeight: fontWeight,
              decoration: underline && onClick != null
                  ? TextDecoration.underline
                  : null)
          : _baseStyle(context).merge(style).copyWith(
              color: extraColor ?? color,
              fontWeight: fontWeight,
              decoration: underline && onClick != null
                  ? TextDecoration.underline
                  : null);

  TextStyle _baseStyle(BuildContext context) => onClick == null
      ? (style ?? _defaultFont)
      : (style ?? _defaultFont).copyWith(color: context.primary);
}
