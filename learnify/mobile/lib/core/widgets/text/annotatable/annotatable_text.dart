import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../features/learning-space/models/annotation_model.dart';
import '../../../../product/language/language_keys.dart';
import '../../../constants/main_type_definitions.dart';
import '../../../extensions/context/theme_extensions.dart';
import '../../../extensions/string/string_extensions.dart';
import '../../dialog/dialog_builder.dart';
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
    final List<_AnnotatableTextItem> mergedAnnotations = _mergeAnnotations;
    return SelectableText.rich(
      TextSpan(
        style: context.bodyMedium,
        children: mergedAnnotations.isEmpty
            ? <TextSpan>[TextSpan(text: content)]
            : List<TextSpan>.generate(
                mergedAnnotations.length,
                (int i) {
                  final _AnnotatableTextItem annotationItem =
                      mergedAnnotations[i];
                  final bool isAnnotation =
                      annotationItem.annotations.isNotEmpty;
                  final String text = content.substring(
                      annotationItem.startIndex, annotationItem.endIndex);
                  return TextSpan(
                    text: text,
                    style: TextStyle(
                      backgroundColor: isAnnotation
                          ? annotationItem.color.withOpacity(.6)
                          : null,
                    ),
                    recognizer: isAnnotation
                        ? (TapGestureRecognizer()
                          ..onTap = () async =>
                              _annotationClick(annotationItem, context))
                        : null,
                  );
                },
              ),
      ),
      selectionControls: CustomTextSelectionControls(
        items: <CustomAnnotatableItem>[
          CustomAnnotatableItem(controlType: SelectionControlType.copy),
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

  List<_AnnotatableTextItem> get _mergeAnnotations {
    final SplayTreeSet<int> indexes =
        SplayTreeSet<int>.from(<int>{0}..add(content.length - 1));
    for (final Annotation a in annotations) {
      indexes
        ..add(a.startIndex)
        ..add(a.endIndex);
    }
    final List<_AnnotatableTextItem> mergedAnnotations =
        <_AnnotatableTextItem>[];
    for (int i = 0; i < indexes.length - 1; i++) {
      final int startIndex = indexes.elementAt(i);
      final int endIndex = indexes.elementAt(i + 1);
      final String text = content.substring(startIndex, endIndex);
      final List<Annotation> foundAnnotations = <Annotation>[];
      for (final Annotation a in annotations) {
        if (a.startIndex > endIndex) break;
        final String aText = content.substring(a.startIndex, a.endIndex);
        if (aText.contains(text)) foundAnnotations.add(a);
      }
      if (foundAnnotations.isEmpty) {
        mergedAnnotations.add(_AnnotatableTextItem(
          startIndex: startIndex,
          endIndex: endIndex,
          color: Colors.transparent,
        ));
      } else if (foundAnnotations.length == 1) {
        final Annotation annotation = foundAnnotations[0];
        mergedAnnotations.add(_AnnotatableTextItem(
          annotations: <Annotation>[annotation],
          startIndex: startIndex,
          endIndex: endIndex,
          color: annotation.color,
        ));
      } else {
        final int r = foundAnnotations
            .map((Annotation e) => e.color.red)
            .toList()
            .reduce((int v1, int v2) => v1 + v2);
        final int g = foundAnnotations
            .map((Annotation e) => e.color.green)
            .toList()
            .reduce((int v1, int v2) => v1 + v2);
        final int b = foundAnnotations
            .map((Annotation e) => e.color.blue)
            .toList()
            .reduce((int v1, int v2) => v1 + v2);
        final int a = foundAnnotations
            .map((Annotation e) => e.color.alpha)
            .toList()
            .reduce((int v1, int v2) => v1 + v2);
        final int length = foundAnnotations.length;
        final _AnnotatableTextItem annotationItem = _AnnotatableTextItem(
          annotations: foundAnnotations,
          startIndex: startIndex,
          endIndex: endIndex,
          color: Color.fromARGB(
              a ~/ length, r ~/ length, g ~/ length, b ~/ length),
        );
        mergedAnnotations.add(annotationItem);
      }
    }
    return mergedAnnotations;
  }

  Future<void> _annotationClick(
      _AnnotatableTextItem annotationItem, BuildContext context) async {
    final List<Annotation> annotations = annotationItem.annotations;
    if (annotations.isEmpty) return;
    if (annotations.length == 1) {
      final Annotation annotation = annotations[0];
      if (annotation.id == null) return;
      final String annotatedText =
          content.substring(annotation.startIndex, annotation.endIndex);
      onAnnotationClick(annotation.id!, annotatedText);
    } else {
      final Set<String> annotatedTexts = <String>{};
      for (final Annotation a in annotations) {
        final String annotatedText =
            content.substring(a.startIndex, a.endIndex);
        annotatedTexts.add(annotatedText);
      }
      final String? selectedText = await DialogBuilder(context)
          .singleSelectDialog(TextKeys.selectAnnotatedDialogTitle,
              annotatedTexts.toList(), null);
      final Annotation? foundA = annotations.firstWhereOrNull((Annotation e) {
        final String annotatedText =
            content.substring(e.startIndex, e.endIndex);
        return annotatedText.compareWithoutCase(selectedText);
      });
      if (foundA?.id == null || selectedText == null) return;
      onAnnotationClick(foundA!.id!, selectedText);
    }
  }
}

class _AnnotatableTextItem {
  const _AnnotatableTextItem({
    required this.startIndex,
    required this.endIndex,
    required this.color,
    this.annotations = const <Annotation>[],
  });
  final List<Annotation> annotations;
  final int startIndex;
  final int endIndex;
  final Color color;
}