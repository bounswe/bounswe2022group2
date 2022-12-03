import '../../../core/base/model/base_model.dart';
import 'learning_space_model.dart';

class EnrollLSResponse extends BaseModel<EnrollLSResponse> {
  const EnrollLSResponse({this.resultMessage, this.learningSpace});

  factory EnrollLSResponse.fromJson(Map<String, dynamic> json) =>
      EnrollLSResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          learningSpace: BaseModel.embeddedModelFromJson<LearningSpace>(
              json['learningSpace'], const LearningSpace()));

  final String? resultMessage;
  final LearningSpace? learningSpace;

  @override
  EnrollLSResponse fromJson(Map<String, dynamic> json) =>
      EnrollLSResponse().fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'learningSpace':
            BaseModel.embeddedModelToJson<LearningSpace>(learningSpace)
      };

  @override
  List<Object?> get props => <Object?>[resultMessage, learningSpace];
}
