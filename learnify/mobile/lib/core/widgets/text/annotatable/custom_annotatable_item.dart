import 'package:flutter/widgets.dart';

import '../../../constants/main_type_definitions.dart';

enum SelectionControlType { copy, selectAll, cut, paste, other }

class CustomAnnotatableItem {
  CustomAnnotatableItem({
    required SelectionControlType controlType,
    String? label,
    Function(String)? onPressed,
    AnnotateCallback? onPressedAnnotation,
  }) : this._(
          label: label,
          onPressed: onPressed,
          onPressedAnnotation: onPressedAnnotation,
          controlType: controlType,
        );

  CustomAnnotatableItem.icon({
    required Widget icon,
    Function(String)? onPressed,
    AnnotateCallback? onPressedAnnotation,
    SelectionControlType controlType = SelectionControlType.other,
  }) : this._(
            controlType: controlType,
            onPressed: onPressed,
            onPressedAnnotation: onPressedAnnotation,
            icon: icon);

  CustomAnnotatableItem._(
      {required this.controlType,
      this.label,
      this.onPressed,
      this.onPressedAnnotation,
      this.icon})
      : assert(
            label != null ||
                controlType != SelectionControlType.other ||
                icon != null,
            "Label is required when the controlType is SelectionControlType.other");

  /// The text to display.
  final String? label;

  final Function(String)? onPressed;
  final AnnotateCallback? onPressedAnnotation;

  /// Control type to manipulate the selection of text
  final SelectionControlType controlType;

  final Widget? icon;
}
