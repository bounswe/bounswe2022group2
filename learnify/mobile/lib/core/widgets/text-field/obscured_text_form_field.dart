import 'package:flutter/material.dart';

import '../../decorations/input_decorations.dart';
import '../../extensions/context/theme_extensions.dart';
import 'text_form_field_wrapper.dart';

/// Base obscured [TextFormField] wrapped with [BaseTextFormFieldWrapper].
class ObscuredTextFormField extends StatefulWidget {
  /// It is specialized for obscured text form fields.
  /// Implements login decoration as default, can be customized with params.
  /// Used for implementation of password and confirm password text form fields.
  const ObscuredTextFormField({
    required this.controller,
    this.onChanged,
    this.showPasswordVisibility = true,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.backgroundColor,
    this.constraints,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
    this.focusNode,
    this.validator,
    this.padding,
    this.style,
    this.prefixWidget,
    this.hintStyle,
    Key? key,
  }) : super(key: key);

  /// Controller for the text form field.
  final TextEditingController controller;

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

  /// Background color of the field.
  final Color? backgroundColor;

  /// Custom constraints.
  final BoxConstraints? constraints;

  /// Custom text input action.
  final TextInputAction textInputAction;

  /// Bool represents whether to show password.
  final bool showPasswordVisibility;

  /// Callback to call when the input is submitted.
  final ValueChanged<String>? onFieldSubmitted;

  /// Focus node to control the focus on the field.
  final FocusNode? focusNode;

  /// Content padding.
  final EdgeInsets? padding;

  /// Custom text style type.
  final TextStyle? style;

  /// Custom prefix widget.
  final Widget? prefixWidget;

  /// Custom hint text style.
  final TextStyle? hintStyle;

  @override
  State<ObscuredTextFormField> createState() => _ObscuredTextFormFieldState();
}

class _ObscuredTextFormFieldState extends State<ObscuredTextFormField> {
  bool _isVisible = false;
  String? error;

  @override
  Widget build(BuildContext context) => BaseTextFormFieldWrapper(
        formField: TextFormField(
          focusNode: widget.focusNode,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          style: context.bodyLarge,
          obscureText: !_isVisible,
          validator: _localValidator,
          decoration: _formDeco,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.visiblePassword,
          autofillHints: const <String>[
            AutofillHints.password,
            AutofillHints.newPassword
          ],
        ),
        constraints: widget.constraints,
        error: error,
      );

  String? _localValidator(String? text) {
    if (widget.validator != null && mounted) {
      setState(() => error = widget.validator!(text));
    }
    return error == null ? null : '';
  }

  /// Gets the corresponding input decoration by checking whether
  /// the show password functionality is enabled.
  InputDecoration get _formDeco => InputDeco(context).loginDeco(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        labelText: widget.labelText,
        suffixIcon: widget.showPasswordVisibility
            ? _isVisible
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined
            : null,
        suffixCallback: _changeVisibility,
        padding: widget.padding,
        color: widget.backgroundColor,
        style: widget.style,
        prefixWidget: widget.prefixWidget,
        hintStyle: widget.hintStyle,
      );

  /// Changes the visibility of password, and reloads the widget.
  void _changeVisibility() {
    if (mounted) setState(() => _isVisible = !_isVisible);
  }
}
