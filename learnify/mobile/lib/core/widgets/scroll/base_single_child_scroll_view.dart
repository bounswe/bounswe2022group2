import 'package:flutter/material.dart';

/// Customized single child scroll view.
class BaseSingleChildScrollView extends SingleChildScrollView {
  /// Default constructor.
  BaseSingleChildScrollView({
    Widget? child,
    ScrollPhysics? physics,
    ScrollViewKeyboardDismissBehavior? dismissBehavior,
    Axis axis = Axis.vertical,
    ScrollController? controller,
    Key? key,
  }) : super(
          physics: physics ?? const AlwaysScrollableScrollPhysics(),
          keyboardDismissBehavior:
              dismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
          padding: const EdgeInsets.only(right: 12),
          child: child,
          controller: controller ?? ScrollController(),
          scrollDirection: axis,
          key: key,
        );
}
