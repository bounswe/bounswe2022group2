import '../../../core/base/model/base_model.dart';
import '../../learning-space/models/learning_space_model.dart';

class GetLearningSpacesResponse extends BaseModel<GetLearningSpacesResponse> {
  const GetLearningSpacesResponse(
      {this.resultMessage, this.learningSpaces = const <LearningSpace>[]});

  factory GetLearningSpacesResponse.fromJson(Map<String, dynamic> json) =>
      GetLearningSpacesResponse(
        resultMessage: BaseModel.getByType<String>(json['resultMessage']),
        learningSpaces: BaseModel.embeddedListFromJson<LearningSpace>(
            json['learning_spaces'], const LearningSpace()),
      );

  final String? resultMessage;
  final List<LearningSpace> learningSpaces;

  @override
  GetLearningSpacesResponse fromJson(Map<String, dynamic> json) =>
      GetLearningSpacesResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'learning_spaces':
            BaseModel.embeddedListToJson<LearningSpace>(learningSpaces),
      };

  @override
  List<Object?> get props => <Object?>[
        resultMessage,
        learningSpaces,
      ];
}
