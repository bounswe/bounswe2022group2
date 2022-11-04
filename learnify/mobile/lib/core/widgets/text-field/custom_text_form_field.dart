import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../decorations/input_decorations.dart';
import '../../extensions/context/theme_extensions.dart';
import 'text_form_field_wrapper.dart';

/// Base [TextFormField] wrapped with [BaseTextFormFieldWrapper].
class CustomTextFormField extends StatefulWidget {
  /// Implements login decoration as default, can be customized with params.
  /// Used for implementation of name and email text form fields.
  const CustomTextFormField({
    this.controller,
    this.validator,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.prefixWidget,
    this.backgroundColor,
    this.constraints,
    this.textInputAction = TextInputAction.done,
    this.autofillHints = const <String>[],
    this.textInputType,
    this.maxLines,
    this.onFieldSubmitted,
    this.focusNode,
    this.padding,
    this.style,
    this.hintStyle,
    this.initialValue,
    this.enabledBorder,
    this.disabledBorder,
    this.errorBorder,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.translateHint = true,
    this.errorSizeFactor,
    this.onSaved,
    this.inputFormatters = const <TextInputFormatter>[],
    this.autovalidateMode,
    this.textAlign = TextAlign.start,
    this.errorStyle,
    this.preFieldWidget,
    this.border,
    this.decoration,
    this.suffix,
    this.enabled = true,
    this.readOnly = false,
    this.showCursor = true,
    this.enableInteractiveSelection,
    this.autofocus,
    this.maxLength,
    Key? key,
  }) : super(key: key);

  /// Controller for the text form field.
  final TextEditingController? controller;

  /// Validator of the text field.
  final FormFieldValidator<String?>? validator;

  /// Callback to call on text change.
  final ValueChanged<String>? onChanged;

  /// Hint text of the field.
  final String? hintText;

  /// Label text of the field.
  final String? labelText;

  /// Prefix icon.
  final IconData? prefixIcon;

  /// Custom prefix widget.
  final Widget? prefixWidget;

  /// Background color of the field.
  final Color? backgroundColor;

  /// Custom constraints.
  final BoxConstraints? constraints;

  /// Custom text input action.
  final TextInputAction textInputAction;

  /// Custom list of auto fill hints.
  final Iterable<String> autofillHints;

  /// Custom text input type.
  final TextInputType? textInputType;

  /// Callback to call when the input is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// Focus node to control the focus on the field.
  final FocusNode? focusNode;

  /// Maximum lines.
  final int? maxLines;

  /// Content padding.
  final EdgeInsets? padding;

  /// Custom text style.
  final TextStyle? style;

  /// Custom initial value.
  final String? initialValue;

  /// Custom hint text style.
  final TextStyle? hintStyle;

  /// Border.
  final InputBorder? disabledBorder;

  /// Border.
  final InputBorder? enabledBorder;

  /// Border.
  final InputBorder? errorBorder;

  /// Border.
  final InputBorder? focusedBorder;

  /// Border.
  final InputBorder? focusedErrorBorder;

  /// Border.
  final InputBorder? border;

  /// Whether to translate hint.
  final bool translateHint;

  /// Error size factor.
  final double? errorSizeFactor;

  /// On saved.
  final ValueChanged<String?>? onSaved;

  /// Text input formatters.
  final List<TextInputFormatter> inputFormatters;

  /// Auto validate mode.
  final AutovalidateMode? autovalidateMode;

  /// Alignment of the text.
  final TextAlign textAlign;

  /// Error text style.
  final TextStyle? errorStyle;

  /// Pre-field widget.
  final Widget? preFieldWidget;

  /// Input decoration
  final InputDecoration? decoration;

  /// Suffix widget
  final Widget? suffix;

  /// enabled
  final bool enabled;

  /// readOnly
  final bool readOnly;

  /// showCursor
  final bool showCursor;

  /// enableInteractiveSelection
  final bool? enableInteractiveSelection;

  /// autofocus
  final bool? autofocus;

  /// maxLength
  final int? maxLength;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? error;

  @override
  Widget build(BuildContext context) => BaseTextFormFieldWrapper(
        formField: TextFormField(
          enabled: widget.enabled,
          controller: widget.controller,
          readOnly: widget.readOnly,
          showCursor: widget.showCursor,
          textInputAction: widget.textInputAction,
          autofocus: widget.autofocus ?? false,
          style: widget.style == null
              ? context.bodyLarge.merge(widget.style)
              : widget.style?.merge(widget.style),
          validator: _localValidator,
          enableInteractiveSelection: widget.enableInteractiveSelection,
          onChanged: (String val) {
            if (widget.onChanged != null) widget.onChanged!(val);
            if (widget.autovalidateMode == AutovalidateMode.always) {
              _localValidator(val);
            }
          },
          maxLength: widget.maxLength,
          autofillHints: widget.autofillHints,
          keyboardType: widget.textInputType,
          decoration: widget.decoration ?? _deco(context),
          maxLines: widget.maxLines,
          onFieldSubmitted: widget.onFieldSubmitted,
          focusNode: widget.focusNode,
          initialValue: widget.initialValue,
          onSaved: widget.onSaved,
          inputFormatters: widget.inputFormatters,
          textAlign: widget.textAlign,
        ),
        errorStyle: widget.errorStyle,
        constraints: widget.constraints,
        error: error,
        errorSizeFactor: widget.errorSizeFactor,
        preFieldWidget: widget.preFieldWidget,
      );

  InputDecoration _deco(BuildContext context) => InputDeco(context).loginDeco(
        hintText: widget.hintText,
        suffix: widget.suffix,
        prefixIcon: widget.prefixIcon,
        prefixWidget: widget.prefixWidget,
        labelText: widget.labelText,
        padding: widget.padding,
        color: widget.backgroundColor,
        style: widget.style,
        hintStyle: widget.hintStyle,
        disabledBorder: widget.disabledBorder,
        enabledBorder: widget.enabledBorder,
        errorBorder: widget.errorBorder,
        focusedBorder: widget.focusedBorder,
        focusedErrorBorder: widget.focusedErrorBorder,
        border: widget.border,
        translateHint: widget.translateHint,
      );

  String? _localValidator(String? text) {
    if (widget.validator != null) {
      if (mounted) setState(() => error = widget.validator!(text));
      error = widget.validator!(text);
    }
    return error == null ? null : '';
  }
}
