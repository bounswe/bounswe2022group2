import 'package:flutter/material.dart';

import '../extensions/context/context_extensions.dart';
import '../extensions/context/theme_extensions.dart';
import '../widgets/base-icon/base_icon.dart';
import '../widgets/buttons/base_icon_button.dart';

/// [InputDeco] class collects all input decorations in one file.
class InputDeco {
  /// * Initializes dynamicSize and theme fields after received the context.
  InputDeco(this.context);

  /// Context to customize design.
  final BuildContext context;

  /// [InputDecoration] for the text form fields in the login screen.
  /// Both "CustomTextFormField" and "ObscuredTextFormField" uses this deco.
  InputDecoration loginDeco({
    String? hintText,
    String? labelText,
    EdgeInsets? padding,
    IconData? prefixIcon,
    Widget? prefixWidget,
    IconData? suffixIcon,
    VoidCallback? suffixCallback,
    Color? color,
    TextStyle? style,
    TextStyle? hintStyle,
    InputBorder? disabledBorder,
    InputBorder? enabledBorder,
    InputBorder? errorBorder,
    InputBorder? focusedBorder,
    InputBorder? focusedErrorBorder,
    InputBorder? border,
    bool translateHint = true,
    Widget? suffix,
  }) =>
      InputDecoration(
        contentPadding: padding ?? _padding(context),
        hoverColor: Theme.of(context).primaryColorLight.withOpacity(.1),
        hintText: hintText == null
            ? null
            : (translateHint ? context.tr(hintText) : hintText),
        hintStyle: hintStyle ?? (style ?? context.bodySmall),
        labelText: labelText == null ? null : context.tr(labelText),
        labelStyle: style ?? context.bodyLarge,
        errorMaxLines: 1,
        errorStyle: const TextStyle(height: 0, color: Colors.transparent),
        prefixIcon: prefixWidget ?? _getPrefixIcon(prefixIcon),
        prefixIconConstraints:
            BoxConstraints.loose(Size.fromHeight(context.responsiveSize * 9)),
        suffixIcon: suffix ?? _getSuffixIcon(suffixIcon, suffixCallback),
        suffixIconConstraints:
            BoxConstraints.loose(Size.fromHeight(context.responsiveSize * 9)),
        filled: true,
        fillColor: color,
        isDense: true,
        disabledBorder: border ?? disabledBorder,
        enabledBorder: border ?? enabledBorder,
        errorBorder: errorBorder,
        focusedBorder: border ?? focusedBorder,
        focusedErrorBorder: focusedErrorBorder,
        // suffix: suffix,
      );

  EdgeInsets? _padding(BuildContext context) =>
      EdgeInsets.symmetric(vertical: context.height * 2);

  /// Returns the prefix icon if there is any provided.
  Widget? _getPrefixIcon(IconData? prefixIcon) => prefixIcon == null
      ? null
      : BaseIcon(
          context,
          prefixIcon,
          color: context.activeColor.withOpacity(.9),
          size: context.responsiveSize * 6,
          padding: EdgeInsets.only(
            left: context.responsiveSize * 5,
            right: context.responsiveSize * 3,
          ),
        );

  /// Returns the suffix icon if there is any provided.
  Widget? _getSuffixIcon(IconData? suffixIcon, VoidCallback? suffixCallback) =>
      suffixIcon == null
          ? null
          : BaseIconButton(
              icon: suffixIcon,
              onPressed: suffixCallback ?? () {},
              padding:
                  EdgeInsets.symmetric(horizontal: context.responsiveSize * 5),
            );
}
