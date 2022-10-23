import 'package:flutter/material.dart';

import '../../constants/main_type_definitions.dart';
import '../../extensions/text-style/text_style_extensions.dart';
import '../../helpers/text_helpers.dart';

/// Base text with custom parameters
/// Wraps [Text] with [FittedBox], and implements some stylings.
class BaseText extends StatelessWidget {
  /// Default constructor for [BaseText].
  const BaseText(
    this.text, {
    this.style,
    this.textAlign = TextAlign.center,
    this.color,
    this.fit,
    this.fontWeight,
    this.maxLength = 90000000,
    this.translated = true,
    this.hyphenate = false,
    this.underline = false,
    this.useCorrectEllipsis = false,
    this.replaceValues = const <ReplaceValue>[],
    this.onClick,
    this.capitalizeAll = false,
    this.capitalize = false,
    this.capitalizeAllWords = false,
    Key? key,
  }) : super(key: key);

  /// Text that will be displayed.
  final String text;

  /// Custom optional style for text.
  final TextStyle? style;

  /// Alignment of the text. It is [TextAlign.center] as default.
  final TextAlign? textAlign;

  /// Custom color for the text.
  final Color? color;

  /// Custom box fit option for [FittedBox], default is [BoxFit.scaleDown].
  final BoxFit? fit;

  /// Custom font weight.
  final FontWeight? fontWeight;

  /// Maximum length for the task.
  final int maxLength;

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

  /// Determines whether to upper case all string.
  final bool capitalizeAll;

  /// Determines whether to capitalize first char.
  final bool capitalize;

  /// Determines whether to capitalize all words.
  final bool capitalizeAllWords;

  @override
  Widget build(BuildContext context) {
    final TextHelpers helper = TextHelpers(
      context,
      color: color,
      style: style,
      underline: underline,
      fontWeight: fontWeight,
      onClick: onClick,
      capitalizeAllWords: capitalizeAllWords,
      textAlign: textAlign,
      capitalizeAll: capitalizeAll,
      capitalize: capitalize,
    );
    return FittedBox(
      fit: fit ?? BoxFit.scaleDown,
      alignment: (textAlign ?? TextAlign.center).alignment,
      child: replaceValues.isEmpty
          ? _normalText(helper)
          : helper.replacedText(text, replaceValues,
              translated: translated, onClick: onClick),
    );
  }

  Widget _normalText(TextHelpers helper) => helper.normalText(
        text,
        translated: translated,
        hyphenate: hyphenate,
        maxLength: maxLength,
        useCorrectEllipsis: useCorrectEllipsis,
      );
}

/// Replace value model.
class ReplaceValue {
  /// Default constructor.
  const ReplaceValue(this.text,
      {this.translate = true, this.color, this.onClick});

  /// Copies the replace value model with the given properties.
  ReplaceValue copyWith({
    AnyCallback? onClick,
    Color? color,
    bool? translate,
    String? text,
  }) =>
      ReplaceValue(
        text ?? this.text,
        onClick: onClick ?? this.onClick,
        color: color ?? this.color,
        translate: translate ?? this.translate,
      );

  /// Text itself.
  final String text;

  /// Determines whether to translate.
  final bool translate;

  /// Color of the text if any.
  final Color? color;

  /// On click callback if the text is clickable.
  final AnyCallback? onClick;
}
