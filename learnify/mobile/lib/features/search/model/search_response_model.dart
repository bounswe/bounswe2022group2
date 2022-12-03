import '../../../core/base/model/base_model.dart';
import '../../learning-space/models/learning_space_model.dart';

class SearchResponse extends BaseModel<SearchResponse> {
  const SearchResponse(
      {this.resultMessage,
      this.resultLearningSpaces = const <LearningSpace>[]});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
      resultMessage: BaseModel.getByType<String>(json['resultMessage']),
      resultLearningSpaces: BaseModel.embeddedListFromJson<LearningSpace>(
          json['learning_spaces'], const LearningSpace()));

  final String? resultMessage;
  final List<LearningSpace> resultLearningSpaces;

  @override
  SearchResponse fromJson(Map<String, dynamic> json) =>
      SearchResponse.fromJson(json);
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
