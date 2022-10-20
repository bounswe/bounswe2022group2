import 'package:flutter/material.dart';

import '../../extensions/context/theme_extensions.dart';

/// Base icon with custom parameters
/// Wraps [Icon] with [FittedBox], and gives some paddings.
class BaseIcon extends FittedBox {
  /// Default constructor for [BaseIcon].
  BaseIcon(
    BuildContext context,
    this.iconData, {
    this.size,
    this.color,
    this.padding,
    this.customFit,
    Key? key,
  }) : super(
          fit: customFit ?? BoxFit.scaleDown,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child:
                Icon(iconData, size: size, color: color ?? context.textColor),
          ),
          key: key,
        );

  /// Icon itself.
  final IconData iconData;

  /// Custom size for icon.
  final double? size;

  /// Color of the icon.
  final Color? color;

  /// Padding for the icon widget.
  final EdgeInsets? padding;

  /// Fit type.
  final BoxFit? customFit;
}
