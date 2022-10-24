import 'package:flutter/material.dart';

import '../../extensions/context/context_extensions.dart';
import '../../extensions/context/theme_extensions.dart';

/// Custom circular indicator.
class CustomLoadingIndicator extends Center {
  /// Default constructor.
  CustomLoadingIndicator(BuildContext context, {double? size, Key? key})
      : super(
          child: SizedBox(
            height: size,
            width: size,
            child: Transform.scale(
              scale: .6,
              child: CircularProgressIndicator(
                  color: context.textColor,
                  strokeWidth: context.responsiveSize * 1.6),
            ),
          ),
          key: key,
        );
}
