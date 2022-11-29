import '../../../core/base/model/base_model.dart';
import 'learning_space_model.dart';

class GetLearningSpacesResponse extends BaseModel<GetLearningSpacesResponse> {
  const GetLearningSpacesResponse(
      {this.resultMessage,
      this.takenLearningSpaces = const <LearningSpace>[],
      this.friendLearningSpaces = const <LearningSpace>[],
      this.recommendedLearningSpaces = const <LearningSpace>[]});

  factory GetLearningSpacesResponse.fromJson(Map<String, dynamic> json) =>
      GetLearningSpacesResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          takenLearningSpaces: BaseModel.embeddedListFromJson<LearningSpace>(
              json['takenls'], const LearningSpace()),
          friendLearningSpaces: BaseModel.embeddedListFromJson<LearningSpace>(
              json['friendls'], const LearningSpace()),
          recommendedLearningSpaces:
              BaseModel.embeddedListFromJson<LearningSpace>(
                  json['recomendedls'], const LearningSpace()));

  final String? resultMessage;
  final List<LearningSpace> takenLearningSpaces;
  final List<LearningSpace> friendLearningSpaces;
  final List<LearningSpace> recommendedLearningSpaces;

  @override
  GetLearningSpacesResponse fromJson(Map<String, dynamic> json) =>
      GetLearningSpacesResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'takenls':
            BaseModel.embeddedListToJson<LearningSpace>(takenLearningSpaces),
        'friendls':
            BaseModel.embeddedListToJson<LearningSpace>(friendLearningSpaces),
        'recomendedls': BaseModel.embeddedListToJson<LearningSpace>(
            recommendedLearningSpaces)
      };

  @override
  List<Object?> get props => <Object?>[
        resultMessage,
        takenLearningSpaces,
        friendLearningSpaces,
        recommendedLearningSpaces
      ];
}
