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

  factory Annotation.dummy(int id) => Annotation(
        id: id.toString(),
        context: "http://www.w3.org/ns/anno.jsonld",
        type: 'Annotation',
        body: <AnnotationBody>[AnnotationBody()],
        target: const AnnotationTarget(),
      );

  factory Annotation.fromJson(Map<String, dynamic> json) => Annotation(
        id: BaseModel.getByType<String>(json['id']),
        context: BaseModel.getByType<String>(json['@context']),
        type: BaseModel.getByType<String>(json['type']),
        target: BaseModel.embeddedModelFromJson<AnnotationTarget>(
            json['target'], const AnnotationTarget()),
        body: BaseModel.embeddedListFromJson<AnnotationBody>(
            json['body'], AnnotationBody()),
      );

  Annotation copyWith({
    String? content,
  }) {
    final Annotation annotation = Annotation(
      id: id,
    );
    annotation.color = colorParam ?? annotation.color;
    return annotation;
  }

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
