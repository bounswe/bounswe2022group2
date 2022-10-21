import 'package:flutter/material.dart';

import '../../constants/main_type_definitions.dart';

/// Customized gesture detector.
class CustomGestureDetector extends GestureDetector {
  /// Default constructor.
  CustomGestureDetector({
    required Widget child,
    AnyCallback? onTap,
    Key? key,
  }) : super(
          child: child,
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            FocusManager.instance.primaryFocus?.unfocus();
            if (onTap != null) await onTap();
          },
          key: key,
        );
}
