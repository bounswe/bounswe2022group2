import 'dart:collection';

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
  Widget build(BuildContext context) {
    final List<Annotation> mergedAnnotations = _mergeAnnotations;
    return SelectableText.rich(
      TextSpan(
        style: context.bodyMedium,
        children: mergedAnnotations.isEmpty
            ? <TextSpan>[TextSpan(text: content)]
            : List<TextSpan>.generate(
                mergedAnnotations.length,
                (int i) {
                  final Annotation annotation = mergedAnnotations[i];
                  final String text = content.substring(
                      annotation.startIndex, annotation.endIndex);
                  return TextSpan(
                    text: text,
                    style: TextStyle(
                      backgroundColor: annotation.isAnnotation
                          ? annotation.color.withOpacity(.6)
                          : null,
                    ),
                    recognizer: !annotation.isAnnotation
                        ? null
                        : (TapGestureRecognizer()
                          ..onTap = () =>
                              onAnnotationClick(annotation.id ?? '', text)),
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
  }

  List<Annotation> get _mergeAnnotations {
    final SplayTreeSet<int> indexes =
        SplayTreeSet<int>.from(<int>{0}..add(content.length - 1));
    for (final Annotation a in annotations) {
      indexes
        ..add(a.startIndex)
        ..add(a.endIndex);
    }
    final List<Annotation> mergedAnnotations = <Annotation>[];
    for (int i = 0; i < indexes.length - 1; i++) {
      final int startIndex = indexes.elementAt(i);
      final int endIndex = indexes.elementAt(i + 1);
      final String text = content.substring(startIndex, endIndex);
      final List<Annotation> foundAnnotations = <Annotation>[];
      for (final Annotation a in annotations) {
        final String aText = content.substring(a.startIndex, a.endIndex);
        if (aText.contains(text)) foundAnnotations.add(a);
      }
      if (foundAnnotations.isEmpty) {
        mergedAnnotations.add(Annotation(
          isAnnotation: false,
          startIndex: startIndex,
          endIndex: endIndex,
          colorParam: Colors.transparent,
        ));
      } else if (foundAnnotations.length == 1) {
        mergedAnnotations.add(foundAnnotations[0].copyWith(
            startIndex: startIndex,
            endIndex: endIndex,
            colorParam: foundAnnotations[0].color));
      } else {
        int r = 0;
        int g = 0;
        int b = 0;
        int a = 0;
        for (int i = 0; i < foundAnnotations.length; i++) {
          r += foundAnnotations[i].color.red;
          g += foundAnnotations[i].color.green;
          b += foundAnnotations[i].color.blue;
          a += foundAnnotations[i].color.alpha;
        }
        final int length = foundAnnotations.length;
        final Annotation newAnnotation = Annotation(
          startIndex: startIndex,
          endIndex: endIndex,
          colorParam: Color.fromARGB(
              a ~/ length, r ~/ length, g ~/ length, b ~/ length),
        );
        mergedAnnotations.add(newAnnotation);
      }
    }
    return mergedAnnotations;
  }
}
