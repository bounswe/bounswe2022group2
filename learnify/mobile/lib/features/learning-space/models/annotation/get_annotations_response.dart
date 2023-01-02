import '../../../../core/base/model/base_model.dart';
import 'annotation_model.dart';

class GetAnnotationsResponse extends BaseModel<GetAnnotationsResponse> {
  const GetAnnotationsResponse({this.annotations = const <Annotation>[]});

  factory GetAnnotationsResponse.fromJson(Map<String, dynamic> json) =>
      GetAnnotationsResponse(
        annotations: BaseModel.embeddedListFromJson<Annotation>(
            json['annotations'], Annotation()),
      );

  @override
  GetAnnotationsResponse fromJson(Map<String, dynamic> json) =>
      GetAnnotationsResponse.fromJson(json);

  final List<Annotation> annotations;

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'annotations': BaseModel.embeddedListToJson<Annotation>(annotations),
      };

  @override
  List<Object?> get props => <Object?>[annotations];
}
