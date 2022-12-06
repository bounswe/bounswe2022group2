import '../../../../core/base/model/base_model.dart';

/// CreateAnnotationRequest model.
class CreateAnnotationRequest extends BaseModel<CreateAnnotationRequest> {
  /// Default constructor.
  const CreateAnnotationRequest({
    this.lsId,
    this.postId,
    this.body,
    this.target,
  });

  factory CreateAnnotationRequest.fromJson(Map<String, dynamic> json) =>
      CreateAnnotationRequest(
        lsId: BaseModel.getByType<String>(json['ls_id']),
        postId: BaseModel.getByType<String>(json['post_id']),
        body: BaseModel.getByType<String>(json['body']),
        target: BaseModel.embeddedModelFromJson<AnnotationTarget>(
            json['target'], const AnnotationTarget()),
      );

  final String? lsId;
  final String? postId;
  final String? body;
  final AnnotationTarget? target;

  @override
  CreateAnnotationRequest fromJson(Map<String, dynamic> json) =>
      CreateAnnotationRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'ls_id': lsId,
        'post_id': postId,
        'body': body,
        'target': BaseModel.embeddedModelToJson<AnnotationTarget>(target),
      };

  @override
  List<Object?> get props => <Object?>[lsId, postId, body, target];
}

/// AnnotationTarget model.
class AnnotationTarget extends BaseModel<AnnotationTarget> {
  /// Default constructor.
  const AnnotationTarget({
    this.id,
    this.type = 'Image',
    this.format,
    this.selector,
  });

  factory AnnotationTarget.fromJson(Map<String, dynamic> json) =>
      AnnotationTarget(
        id: BaseModel.getByType<String>(json['_id']) ??
            BaseModel.getByType<String>(json['id']),
        type: BaseModel.getWithDefault<String>(json['type'], 'Image'),
        format: BaseModel.getByType<String>(json['format']),
        selector: BaseModel.embeddedModelFromJson<AnnotationSelector>(
          json['selector'],
          const AnnotationSelector(),
        ),
      );

  final String? id;
  final String type;
  final String? format;
  final AnnotationSelector? selector;

  @override
  AnnotationTarget fromJson(Map<String, dynamic> json) =>
      AnnotationTarget.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        if (id != null) 'id': id,
        if (format != null) 'type': 'Image',
        if (format != null) 'format': format,
        if (selector != null)
          'selector':
              BaseModel.embeddedModelToJson<AnnotationSelector>(selector),
      };

  @override
  List<Object?> get props => <Object?>[id, type, format, selector];
}

/// AnnotationSelector model.
class AnnotationSelector extends BaseModel<AnnotationSelector> {
  /// Default constructor.
  const AnnotationSelector({
    this.start,
    this.end,
    this.type = 'TextPositionSelector',
  });

  factory AnnotationSelector.fromJson(Map<String, dynamic> json) =>
      AnnotationSelector(
        start: BaseModel.getByType<int>(json['start']),
        end: BaseModel.getByType<int>(json['end']),
        type: BaseModel.getWithDefault<String>(
            json['type'], 'TextPositionSelector'),
      );

  final int? start;
  final int? end;
  final String type;

  @override
  AnnotationSelector fromJson(Map<String, dynamic> json) =>
      AnnotationSelector.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'start': start,
        'end': end,
        'type': 'TextPositionSelector',
      };

  @override
  List<Object?> get props => <Object?>[start, end, type];
}
