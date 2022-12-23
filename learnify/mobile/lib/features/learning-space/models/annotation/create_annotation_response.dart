import '../../../../core/base/model/base_model.dart';
import 'annotation_model.dart';

class CreateAnnotationResponse extends BaseModel<CreateAnnotationResponse> {
  const CreateAnnotationResponse({this.annotation});

  factory CreateAnnotationResponse.fromJson(Map<String, dynamic> json) =>
      CreateAnnotationResponse(
        annotation: BaseModel.embeddedModelFromJson<Annotation>(
            json['annotation'], Annotation()),
      );

  @override
  CreateAnnotationResponse fromJson(Map<String, dynamic> json) =>
      CreateAnnotationResponse.fromJson(json);

  final Annotation? annotation;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'annotation': BaseModel.embeddedModelToJson<Annotation>(annotation),
      };

  @override
  List<Object?> get props => <Object?>[annotation];
}
