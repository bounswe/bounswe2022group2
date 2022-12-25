import '../../../core/base/model/base_model.dart';
import '../../learning-space/models/learning_space_model.dart';

class UserSearchResponse extends BaseModel<UserSearchResponse> {
  const UserSearchResponse({this.users = const <String>[]});

  factory UserSearchResponse.fromJson(Map<String, dynamic> json) =>
      UserSearchResponse(
          users:BaseModel.getByType<List<String>>?(json['users']),);

  final List<String> users;

  @override
  UserSearchResponse fromJson(Map<String, dynamic> json) =>
      UserSearchResponse.fromJson(json);
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
