import 'package:flutter/material.dart';

import '../../../../../core/base/model/base_model.dart';
import '../../../../core/helpers/color_helpers.dart';
import 'create_annotation_request.dart';

// ignore: must_be_immutable
class Annotation extends BaseModel<Annotation> {
  Annotation({
    this.id,
    this.context,
    this.type,
    this.body = const <AnnotationBody>[],
    this.target,
  });

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        id: BaseModel.getByType<String>(json['id']),
        context: BaseModel.getByType<String>(json['@context']),
        type: BaseModel.getByType<String>(json['type']),
        target: BaseModel.embeddedModelFromJson<AnnotationTarget>(
            json['target'], const AnnotationTarget()),
        body: BaseModel.embeddedListFromJson<AnnotationBody>(
            json['body'], AnnotationBody()),
      );

  final String? id;
  final String? context;
  final String? type;
  final List<AnnotationBody> body;
  final AnnotationTarget? target;
  Color? colorParam;

  @override
  Annotation fromJson(Map<String, dynamic> json) => Annotation.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'id': id,
        '@context': context,
        'type': type,
        'body': BaseModel.embeddedListToJson<AnnotationBody>(body),
        'target': BaseModel.embeddedModelToJson<AnnotationTarget>(target)
      };

  @override
  List<Object?> get props => <Object?>[id, context, type, body, target];

  Color get color {
    if (colorParam != null) return colorParam!;
    return colorParam = ColorHelpers.lightRandomColor;
  }

  set color(Color newColor) => colorParam = newColor;
}

class AnnotationTarget extends BaseModel<AnnotationTarget> {
  const AnnotationTarget({
    this.source,
    this.type,
    this.id,
    this.format,
    this.source,
    this.selector,
  });

  factory AnnotationTarget.fromJson(Map<String, dynamic> json) =>
      AnnotationTarget(
        format: BaseModel.getByType<String>(json['format']),
        type: BaseModel.getByType<String>(json['type']),
        id: BaseModel.getByType<String>(json['id']),
        source: BaseModel.getByType<String>(json['source']),
        selector: BaseModel.embeddedModelFromJson<AnnotationSelector>(
            json['selector'], AnnotationSelector()),
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
