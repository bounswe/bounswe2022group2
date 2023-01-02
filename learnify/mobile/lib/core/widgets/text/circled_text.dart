import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import 'base_text.dart';

/// Text that is wrapped with a circle colored conatiner.
class CircledText extends StatelessWidget {
  /// Default constructor of [CircledText].
  const CircledText({
    this.text,
    this.textWidget,
    this.color,
    this.textStyle,
    this.paddingFactor = 0,
    this.margin,
    this.sizeFactor = 5,
    Key? key,
  })  : assert(text != null || textWidget != null,
            'You should either provide a text or a custom text widget.'),
        super(key: key);

  /// Text of the widget.
  final String? text;

  /// Complete custom text widget.
  final Widget? textWidget;

  /// Color of the wrapper.
  final Color? color;

  /// Customized text style.
  final TextStyle? textStyle;

  /// Padding factor.
  final double paddingFactor;

  /// Margin around the widget.
  final EdgeInsets? margin;

  /// Size factor.
  final double sizeFactor;

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(3),
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
            color: color ?? context.primary.withOpacity(.3),
            shape: BoxShape.circle),
        width: context.width * sizeFactor,
        child: textWidget ??
            BaseText(
              text!,
              translated: false,
              fontWeight: FontWeight.w400,
              style: textStyle,
            ),
      );
}
