import '../../../core/base/model/base_model.dart';
import '../../learning-space/models/learning_space_model.dart';

class LsSearchResponse extends BaseModel<LsSearchResponse> {
  const LsSearchResponse(
      {this.resultMessage,
      this.resultLearningSpaces = const <LearningSpace>[]});

  factory LsSearchResponse.fromJson(Map<String, dynamic> json) =>
      LsSearchResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          resultLearningSpaces: BaseModel.embeddedListFromJson<LearningSpace>(
              json['learning_spaces'], const LearningSpace()));

  final String? resultMessage;
  final List<LearningSpace> resultLearningSpaces;

  @override
  LsSearchResponse fromJson(Map<String, dynamic> json) =>
      LsSearchResponse.fromJson(json);
  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'learning_spaces':
            BaseModel.embeddedListToJson<LearningSpace>(resultLearningSpaces),
      };

  @override
  List<Object?> get props => <Object?>[
        resultMessage,
        resultLearningSpaces,
      ];
}
