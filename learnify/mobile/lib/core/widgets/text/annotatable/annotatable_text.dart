import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../features/learning-space/models/annotation_model.dart';
import '../../../constants/main_type_definitions.dart';
import '../../../extensions/context/theme_extensions.dart';
import 'custom_annotatable_item.dart';
import 'custom_text_selection_controls.dart';

class AnnotatableText extends StatelessWidget {
  const AnnotatableText({
    required this.content,
    required this.annotations,
    required this.onAnnotationClick,
    required this.annotateLabel,
    required this.annotateCallback,
    this.items,
    this.textStyles,
    Key? key,
  }) : super(key: key);

  final String content;

  final List<CustomAnnotatableItem>? items;

  final List<Annotation> annotations;

  final List<TextStyle?>? textStyles;

  final AnnotationClickCallback onAnnotationClick;

  final String? annotateLabel;

  final Function(int startIndex, int endIndex)? annotateCallback;

  @override
  Widget build(BuildContext context) => SelectableText.rich(
        TextSpan(
          style: context.bodyMedium,
          children: annotations.isEmpty
              ? <TextSpan>[TextSpan(text: content)]
              : List<TextSpan>.generate(
                  annotations.length * 2 + 1,
                  (int i) {
                    final bool isLast = i == annotations.length * 2;
                    final Annotation currentAnnotation =
                        isLast ? const Annotation() : annotations[i ~/ 2];
                    final String text = content.substring(
                        _startIndex(i, currentAnnotation),
                        _endIndex(i, currentAnnotation, isLast));
                    return TextSpan(
                      text: text,
                      style: TextStyle(
                          backgroundColor: i.isEven ? null : context.primary),
                      recognizer: i.isEven
                          ? null
                          : (TapGestureRecognizer()
                            ..onTap = () => onAnnotationClick(
                                currentAnnotation.id ?? '', text)),
                    );
                  },
                ),
        ),
        selectionControls: CustomTextSelectionControls(
          items: <CustomAnnotatableItem>[
            CustomAnnotatableItem(controlType: SelectionControlType.copy),
            CustomAnnotatableItem(controlType: SelectionControlType.paste),
            CustomAnnotatableItem(
              controlType: SelectionControlType.other,
              label: annotateLabel,
              onPressedAnnotation: annotateCallback,
            ),
          ],
          annotations: annotations,
          textStyles: textStyles,
        ),
      );

  int _startIndex(int i, Annotation annotation) => i.isEven
      ? (i == 0 ? 0 : annotations[(i ~/ 2) - 1].endIndex + 1)
      : annotation.startIndex;

  int _endIndex(int i, Annotation annotation, bool isLast) => i.isEven
      ? (isLast ? content.length : annotation.startIndex)
      : annotation.endIndex + 1;
}
