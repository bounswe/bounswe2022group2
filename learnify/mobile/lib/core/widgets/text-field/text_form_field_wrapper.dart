import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../text/multiline_text.dart';

/// Base [TextFormField] wrapper to manage the size values in one place.
class BaseTextFormFieldWrapper extends StatelessWidget {
  /// Implements the given width and avoids exceeding a specific height.
  const BaseTextFormFieldWrapper({
    required this.formField,
    this.constraints,
    this.error,
    this.errorSizeFactor,
    this.errorStyle,
    this.preFieldWidget,
    Key? key,
  }) : super(key: key);

  /// Form field.
  final Widget formField;

  /// Custom constraints.
  final BoxConstraints? constraints;

  /// Error of the validation.
  final String? error;

  /// errorIconSize
  final double? errorSizeFactor;

  /// Error text style.
  final TextStyle? errorStyle;

  /// Pre-field widget.
  final Widget? preFieldWidget;

  @override
  Widget build(BuildContext context) => preFieldWidget != null
      ? Padding(
          padding: EdgeInsets.symmetric(vertical: context.height * .7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  preFieldWidget!,
                  context.sizedW(2.5),
                  if (constraints != null)
                    ConstrainedBox(constraints: constraints!, child: formField)
                  else
                    Expanded(child: formField),
                ],
              ),
              if (error != null)
                CustomFieldError(
                  error: error!,
                  errorSizeFactor: errorSizeFactor,
                  errorStyle: errorStyle,
                  hasPreWidget: preFieldWidget != null,
                )
            ],
          ),
        )
      : Container(
          margin: EdgeInsets.symmetric(vertical: context.height * .7),
          constraints: constraints ??
              BoxConstraints.loose(
                Size(context.width * 75, context.height * 30),
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              formField,
              if (error != null)
                CustomFieldError(
                  error: error!,
                  errorSizeFactor: errorSizeFactor,
                  errorStyle: errorStyle,
                  hasPreWidget: preFieldWidget != null,
                )
            ],
          ),
        );
}

/// Custom field error.
class CustomFieldError extends StatelessWidget {
  /// Default constructor.
  const CustomFieldError({
    required this.error,
    this.hasPreWidget = false,
    this.errorSizeFactor,
    this.errorStyle,
    Key? key,
  }) : super(key: key);

  /// Pre field widget.
  final bool hasPreWidget;

  /// Error size factor.
  final double? errorSizeFactor;

  /// Error text
  final String error;

  /// Error style.
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    final double sizeFactor = errorSizeFactor ?? 2.8;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: hasPreWidget ? 0 : context.width * 1.2,
          vertical: sizeFactor / 5.6),
      child: Row(
        mainAxisAlignment:
            hasPreWidget ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: <Widget>[
          Icon(Icons.warning_amber_outlined, size: sizeFactor),
          context.sizedW(sizeFactor * (1.8 / 2.8)),
          Flexible(
            child: MultiLineText(
              error,
              translated: false,
              color: context.errorColor,
              textAlign: TextAlign.start,
              maxLines: 3,
              style: errorStyle ?? context.labelMedium
                ..copyWith(
                  fontSize: errorSizeFactor == null
                      ? null
                      : context.responsiveSize * (errorSizeFactor! / 1.12),
                ),
            ),
          ),
        ],
      ),
    );
  }
}
