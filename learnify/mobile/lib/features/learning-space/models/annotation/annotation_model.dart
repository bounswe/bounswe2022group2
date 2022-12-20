import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../../core/base/model/base_model.dart';
import '../../../../core/extensions/string/string_extensions.dart';
import '../../../../core/helpers/color_helpers.dart';

// ignore: must_be_immutable
class Annotation extends BaseModel<Annotation> {
  Annotation({
    this.id,
    this.context,
    this.type,
    this.body,
    this.target,
    this.colorParam,
  });

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        id: BaseModel.getByType<String>(json['id']),
        context: BaseModel.getByType<String>(json['@context']),
        type: BaseModel.getByType<String>(json['type']),
        target: BaseModel.embeddedModelFromJson<AnnotationTarget>(
            json['target'], const AnnotationTarget()),
        body: BaseModel.getByType<String>(json['body']),
      );

  final String? id;
  final String? context;
  final String? type;
  final String? body;
  final AnnotationTarget? target;
  Color? colorParam;

  @override
  Annotation fromJson(Map<String, dynamic> json) => Annotation.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        '@context': context,
        'type': type,
        'body': body,
        'target': BaseModel.embeddedModelToJson<AnnotationTarget>(target)
      };

  @override
  List<Object?> get props => <Object?>[id, context, type, body, target];

  Color get color {
    if (colorParam != null) return colorParam!;
    return colorParam = ColorHelpers.lightRandomColor;
  }

  set color(Color newColor) => colorParam = newColor;

  bool get isImage =>
      (target?.type?.compareWithoutCase('Image') ?? false) ||
      (target?.selector == null);

  Tuple2<Offset, Offset> get startEndOffsets {
    Offset? startOffset;
    Offset? endOffset;
    if (isImage) {
      final String? imageUrl = target?.id;
      if (imageUrl != null) {
        final int hashIndex =
            !imageUrl.contains('#') ? 0 : imageUrl.indexOf('#');
        if (hashIndex > 0) {
          String temp = imageUrl;
          int nextComma = temp.indexOf('#xywh=');
          if (nextComma < temp.length) {
            temp = temp.substring(nextComma + 6);
            nextComma = temp.indexOf(',');
            final String x = temp.substring(0, nextComma);
            temp = temp.substring(nextComma + 1);
            nextComma = temp.indexOf(',');
            final String y = temp.substring(0, nextComma);
            temp = temp.substring(nextComma + 1);
            nextComma = temp.indexOf(',');
            final String w = temp.substring(0, nextComma);
            temp = temp.substring(nextComma + 1);
            final String h = temp.substring(0);
            startOffset =
                Offset(double.tryParse(x) ?? 0, double.tryParse(y) ?? 0);
            endOffset = Offset(startOffset.dx + (double.tryParse(w) ?? 0),
                startOffset.dy + (double.tryParse(h) ?? 0));
          }
        }
      }
    }
    return Tuple2<Offset, Offset>(
        startOffset ?? Offset.zero, endOffset ?? Offset.zero);
  }

  String? get imageUrl {
    final int? hashIndex = target?.id?.indexOf('#');
    if (hashIndex == -1 || hashIndex == null) return null;
    return target?.id?.substring(0, hashIndex);
  }

  int get startIndex => target?.selector?.start ?? 0;
  int get endIndex => target?.selector?.end ?? 0;
}

class AnnotationTarget extends BaseModel<AnnotationTarget> {
  const AnnotationTarget({
    this.source,
    this.type,
    this.id,
    this.format,
    this.selector,
  });

  factory AnnotationTarget.fromJson(Map<String, dynamic> json) =>
      AnnotationTarget(
        format: BaseModel.getByType<String>(json['format']),
        type: BaseModel.getByType<String>(json['type']),
        id: BaseModel.getByType<String>(json['id']),
        source: BaseModel.getByType<String>(json['source']),
        selector: BaseModel.embeddedModelFromJson<AnnotationSelector>(
            json['selector'], const AnnotationSelector()),
      );

  @override
  AnnotationTarget fromJson(Map<String, dynamic> json) =>
      AnnotationTarget.fromJson(json);

  final String? source;
  final AnnotationSelector? selector;
  final String? type;
  final String? id;
  final String? format;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'source': source,
        'selector': BaseModel.embeddedModelToJson<AnnotationSelector>(selector),
        'type': type,
        'id': id,
        'format': format,
      };

  @override
  List<Object?> get props => <Object?>[id, type, format, source, selector];
}

class AnnotationSelector extends BaseModel<AnnotationSelector> {
  const AnnotationSelector({
    this.type,
    this.start,
    this.end,
  });

  factory AnnotationSelector.fromJson(Map<String, dynamic> json) =>
      AnnotationSelector(
        type: BaseModel.getByType<String>(json['type']),
        start: BaseModel.getByType<int>(json['start']),
        end: BaseModel.getByType<int>(json['end']),
      );

  @override
  AnnotationSelector fromJson(Map<String, dynamic> json) =>
      AnnotationSelector.fromJson(json);

  final String? type;
  final int? start;
  final int? end;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'type': type,
        'start': start,
        'end': end,
      };

  @override
  List<Object?> get props => <Object?>[type, start, end];
}
