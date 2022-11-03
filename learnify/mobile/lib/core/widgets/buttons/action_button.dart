import 'dart:async';

import 'package:flutter/material.dart';

import '../../../product/language/language_keys.dart';
import '../../constants/main_type_definitions.dart';
import '../../decorations/button_styles.dart';
import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../dialog/dialog_builder.dart';
import '../indicators/custom_loading_indicator.dart';
import '../text/base_text.dart';

/// Custom action button specific to text widgets.
class ActionButton extends StatefulWidget {
  /// Default constructor for [ActionButton].
  const ActionButton({
    this.text,
    this.clickedText,
    this.onPressed,
    this.onPressedError,
    this.backgroundColor,
    this.padding,
    this.isActive = true,
    this.sizeFactor,
    this.focusNode,
    this.translated = true,
    this.capitalizeAll = false,
    this.textStyle,
    this.textWidget,
    this.icon,
    this.height,
    this.heightFactor,
    this.borderRadius,
    this.style,
    Key? key,
  })  : assert(onPressed != null || onPressedError != null,
            'You should provide either of them.'),
        assert(text != null || textWidget != null,
            'You should provide either of them.'),
        super(key: key);

  /// Callback that will be executed on a button press.
  final AnyCallback? onPressed;

  /// Callback to execute on a button press and will also show error messages.
  final ErrorHelper? onPressedError;

  /// Text that will be displayed on the button.
  final String? text;

  /// Text that will be displayed on the button.
  final String? clickedText;

  /// BackgroundColor of the button.
  final Color? backgroundColor;

  /// Custom padding value.
  final EdgeInsets? padding;

  /// Determines whether the button is active.
  final bool isActive;

  /// Custom size value.
  final Size? sizeFactor;

  /// Custom focus node.
  final FocusNode? focusNode;

  /// Determines whether the text should be converted.
  final bool translated;

  /// Whether to capitalize all.
  final bool capitalizeAll;

  /// Style of the button text.
  final TextStyle? textStyle;

  /// Custom text widget.
  final Widget? textWidget;

  /// Custom icon widget.
  final Widget? icon;

  /// Height.
  final double? height;

  /// Height factor.
  final double? heightFactor;

  /// Custom border radius.
  final BorderRadius? borderRadius;

  /// Button style.
  final ButtonStyle? style;

  @override
  State<ActionButton> createState() => ActionButtonState();
}

/// State of the action button.
class ActionButtonState extends State<ActionButton> {
  bool _isLoading = false;
  late double _loadingSize;
  late double _defaultWidth;
  bool _clicked = false;

  static const Duration _duration = Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    _loadingSize = context.responsiveSize * 5;
    _defaultWidth = context.width * (widget.sizeFactor?.width ?? 70);
    return widget.icon == null
        ? ElevatedButton(
            onPressed: widget.isActive ? localOnPressed : null,
            style: _buttonStyle(),
            focusNode: widget.focusNode,
            child: AnimatedContainer(
              duration: _duration,
              width: _buttonWidth,
              height: _buttonHeight,
              child: _buttonChild,
            ),
          )
        : AnimatedContainer(
            duration: _duration,
            width: _buttonWidth,
            height: _buttonHeight,
            child: ElevatedButton.icon(
              onPressed: widget.isActive ? localOnPressed : null,
              style: _buttonStyle(),
              focusNode: widget.focusNode,
              label: _buttonChild,
              icon: widget.icon!,
            ),
          );
  }

  ButtonStyle? _buttonStyle({EdgeInsets? padding}) =>
      widget.style ??
      ButtonStyles(context).elevated(
        backgroundColor: widget.isActive
            ? (widget.backgroundColor ?? context.primary)
            : context.activeColor.withAlpha(20),
        padding: padding ?? widget.padding,
        borderRadius: widget.borderRadius,
      );

  Widget get _buttonChild => _isLoading
      ? CustomLoadingIndicator(context)
      : widget.textWidget ??
          BaseText(
            widget.clickedText == null
                ? widget.text!
                : (_clicked ? widget.clickedText! : widget.text!),
            color: widget.isActive
                ? context.activeColor
                : context.inactiveTextColor,
            translated: widget.translated,
            style: widget.textStyle ?? context.titleSmall,
            capitalizeAll: widget.capitalizeAll,
          );

  double get _buttonWidth =>
      _isLoading ? _loadingSize * (widget.icon == null ? 3 : 4) : _defaultWidth;

  double get _buttonHeight =>
      widget.height ??
      (widget.heightFactor == null
          ? context.height * (widget.sizeFactor?.height ?? 4.2)
          : context.responsiveSize * widget.heightFactor!);

  /// On pressed function.
  Future<void> localOnPressed() async {
    _clicked = true;
    if (_isLoading) return;
    FocusManager.instance.primaryFocus?.unfocus();
    _switchLoading();
    if (widget.onPressedError != null) {
      final String? error = await widget.onPressedError!();
      if (error != null && mounted) {
        unawaited(DialogBuilder(context)
            .textDialog(error.toString(), TextKeys.errorTitle));
      }
    } else if (widget.onPressed != null) {
      await widget.onPressed!();
    }
    _switchLoading();
  }

  void _switchLoading() {
    if (mounted) setState(() => _isLoading = !_isLoading);
  }
}
