import 'package:flutter/material.dart';

import '../../constants/main_type_definitions.dart';
import '../../helpers/text_helpers.dart';
import 'base_text.dart';

export '../../helpers/text_helpers.dart';

/// Base text with custom parameters but not wrapped with [FittedBox].
class MultiLineText extends StatelessWidget {
  /// It's difference from the "BaseText" is allowing multiline texts.
  /// Implements some further customizations.
  const MultiLineText(
    this.text, {
    this.style,
    this.textAlign,
    this.maxLines = 4,
    this.color,
    this.translated = true,
    this.hyphenate = false,
    this.underline = false,
    this.useCorrectEllipsis = false,
    this.replaceValues = const <ReplaceValue>[],
    this.onClick,
    this.capitalizeAllWords = false,
    this.capitalizeAll = false,
    this.capitalize = false,
    this.fontWeight,
    Key? key,
  }) : super(key: key);

  /// Text content.
  final String text;

  /// Custom style for the text.
  final TextStyle? style;

  /// Alignment of the task.
  final TextAlign? textAlign;

  /// Maximum liens for the text.
  final int? maxLines;

  /// Custom color for the text.
  final Color? color;

  /// Whether the given text is directly a text or to be translated.
  final bool translated;

  /// Determines whether to hyphenate.
  final bool hyphenate;

  /// Determines whether to underline.
  final bool underline;

  /// Determines whether to use correct ellipsis.
  final bool useCorrectEllipsis;

  /// List of values to be replaced.
  final List<ReplaceValue> replaceValues;

  /// On text click callback.
  final AnyCallback? onClick;

  /// Whether to capitalize all words.
  final bool capitalizeAllWords;

  /// Determines whether to upper case all string.
  final bool capitalizeAll;

  /// Determines whether to capitalize the first letter of the string.
  final bool capitalize;

  /// fontWeight
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final TextHelpers helper = TextHelpers(
      context,
      color: color,
      style: style,
      underline: underline,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      capitalizeAllWords: capitalizeAllWords,
      onClick: onClick,
      textAlign: textAlign,
      capitalizeAll: capitalizeAll,
      capitalize: capitalize,
      fontWeight: fontWeight,
    );
    return replaceValues.isEmpty
        ? _normalText(helper)
        : helper.replacedText(text, replaceValues,
            translated: translated, onClick: onClick);
  }

  Widget _normalText(TextHelpers helper) => helper.normalText(
        text,
        translated: translated,
        hyphenate: hyphenate,
        useCorrectEllipsis: useCorrectEllipsis,
      );
}
