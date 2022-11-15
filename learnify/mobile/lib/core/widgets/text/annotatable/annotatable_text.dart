import 'package:flutter/material.dart';

import 'custom_annotatable_item.dart';
import 'custom_text_selection_controls.dart';

class AnnotatableText extends CustomSelectableText {
  AnnotatableText(
    String text, {
    required String annotateLabel,
    required ValueChanged<String> annotateCallback,
    List<TextStyle?>? textStyles,
    super.focusNode,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.textScaleFactor,
    super.minLines,
    super.maxLines,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.scrollPhysics,
    super.semanticsLabel,
    super.textHeightBehavior,
    super.textWidthBasis,
    super.onSelectionChanged,
    Key? key,
  }) : super(
          text,
          key: key,
          items: <CustomAnnotatableItem>[
            CustomAnnotatableItem(controlType: SelectionControlType.copy),
            CustomAnnotatableItem(controlType: SelectionControlType.paste),
            CustomAnnotatableItem(
              controlType: SelectionControlType.other,
              label: annotateLabel,
              onPressed: annotateCallback,
            ),
          ],
          textStyles: textStyles,
        );
}

class CustomSelectableText extends SelectableText {
  CustomSelectableText(
    super.data, {
    Key? key,
    this.items,
    this.textStyles,
    super.focusNode,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.textScaleFactor,
    super.minLines,
    super.maxLines,
    super.cursorHeight,
    super.cursorRadius,
    super.cursorColor,
    super.scrollPhysics,
    super.semanticsLabel,
    super.textHeightBehavior,
    super.textWidthBasis,
    super.onSelectionChanged,
  }) : super(
            key: key,
            selectionControls: CustomTextSelectionControls(
                items: items, textStyles: textStyles));

  /// Creates an array of [CustomAnnotatableItem].
  final List<CustomAnnotatableItem>? items;

  final List<TextStyle?>? textStyles;
}
