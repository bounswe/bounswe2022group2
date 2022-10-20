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
            ),
            splashRadius: splashRadius ?? context.responsiveSize * 4,
            padding: padding ?? EdgeInsets.zero,
            highlightColor: highlightColor ?? context.primaryLight,
            constraints: const BoxConstraints(),
            iconSize: context.responsiveSize * (sizeFactor ?? 5.5),
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
