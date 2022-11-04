import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';
import '../base-icon/base_icon.dart';

/// Customized [IconButton].
class BaseIconButton extends StatelessWidget {
  /// Default constructor for [BaseIconButton].
  const BaseIconButton({
    required this.onPressed,
    required this.icon,
    this.color,
    this.highlightColor,
    this.hoverColor,
    this.padding,
    this.margin,
    this.splashRadius,
    this.sizeFactor,
    this.iconPadding,
    Key? key,
  }) : super(key: key);

  /// Callback to call when on pressed to the button.
  final VoidCallback? onPressed;

  /// Icon to represent in the button.
  final IconData icon;

  /// Custom color for the icon.
  final Color? color;

  /// Custom highlightColor for the icon button.
  final Color? highlightColor;

  /// Custom hoverColor for the icon button.
  final Color? hoverColor;

  /// Padding around the icon.
  final EdgeInsets? padding;

  /// Padding around the icon.
  final EdgeInsets? iconPadding;

  /// Margin around the icon.
  final EdgeInsets? margin;

  /// Custom splash radius value.
  final double? splashRadius;

  /// Custom size value.
  final double? sizeFactor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          child: IconButton(
            icon: BaseIcon(
              context,
              icon,
              color: color,
              size: sizeFactor == null
                  ? null
                  : context.responsiveSize * sizeFactor!,
              padding: iconPadding,
            ),
            splashRadius: splashRadius ??
                (context.responsiveSize *
                    (sizeFactor == null ? 5.8 : sizeFactor! * 1.3)),
            padding: padding ?? EdgeInsets.zero,
            highlightColor:
                (highlightColor ?? context.activeColor).withOpacity(.6),
            constraints: const BoxConstraints(),
            iconSize: sizeFactor == null
                ? null
                : (context.responsiveSize * sizeFactor!),
            onPressed: onPressed == null
                ? null
                : () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    onPressed!();
                  },
            hoverColor: hoverColor ?? context.primary,
          ),
        ),
      );
}
