import 'package:flutter/widgets.dart';

enum SelectionControlType { copy, selectAll, cut, paste, other }

class CustomAnnotatableItem {
  CustomAnnotatableItem({
    required SelectionControlType controlType,
    String? label,
    Function(String)? onPressed,
  }) : this._(label: label, onPressed: onPressed, controlType: controlType);

  CustomAnnotatableItem.icon({
    required Widget icon,
    Function(String)? onPressed,
    SelectionControlType controlType = SelectionControlType.other,
  }) : this._(controlType: controlType, onPressed: onPressed, icon: icon);

  CustomAnnotatableItem._(
      {required this.controlType, this.label, this.onPressed, this.icon})
      : assert(
            label != null ||
                controlType != SelectionControlType.other ||
                icon != null,
            "Label is required when the controlType is SelectionControlType.other");

  /// The text to display.
  final String? label;

  final Function(String)? onPressed;

  /// Control type to manipulate the selection of text
  final SelectionControlType controlType;

  final Widget? icon;
}
