import '../../../../core/base/model/base_model.dart';
import 'learning_space_model.dart';

class CreateLSResponse extends BaseModel<CreateLSResponse> {
  const CreateLSResponse({this.resultMessage, this.learningSpace});

  factory CreateLSResponse.fromJson(Map<String, dynamic> json) =>
      CreateLSResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          learningSpace: BaseModel.embeddedModelFromJson<LearningSpace>(
              json['learningSpace'], const LearningSpace()));

  final String? resultMessage;
  final LearningSpace? learningSpace;

  @override
  CreateLSResponse fromJson(Map<String, dynamic> json) =>
      CreateLSResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'learningSpace':
            BaseModel.embeddedModelToJson<LearningSpace>(learningSpace)
      };

  @override
  List<Object?> get props => <Object?>[resultMessage, learningSpace];
}
