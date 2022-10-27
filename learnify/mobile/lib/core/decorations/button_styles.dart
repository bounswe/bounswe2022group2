import 'package:flutter/material.dart';

import '../extensions/context/context_extensions.dart';

/// Collection of button styles.
class ButtonStyles {
  /// Default constructor.
  ButtonStyles(this.context);

  /// Context to customize design.
  final BuildContext context;

  /// Returns the style of elevated button.
  ButtonStyle? elevated({
    BorderSide? borderSide,
    EdgeInsets? padding,
    Size? size,
    Color? backgroundColor,
    BorderRadius? borderRadius,
  }) =>
      ElevatedButton.styleFrom(
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: context.width * 5, vertical: context.height * .8),
        backgroundColor: backgroundColor,
        disabledForegroundColor: backgroundColor?.withOpacity(0.38),
        disabledBackgroundColor: backgroundColor?.withOpacity(0.12),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: borderSide,
        minimumSize: Size.zero,
        fixedSize: size,
        shape: RoundedRectangleBorder(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(4)),
        ),
      );
}
