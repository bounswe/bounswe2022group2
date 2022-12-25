import '../../../core/base/model/base_model.dart';
import '../../learning-space/models/learning_space_model.dart';

class GetProfileResponse extends BaseModel<GetProfileResponse> {
  const GetProfileResponse({
    this.username,
    this.bio,
    this.profilePicture,
    this.participated = const <LearningSpace>[],
    this.created = const <LearningSpace>[],
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetProfileResponse(
        username: BaseModel.getByType<String>(json['username']),
        bio: BaseModel.getByType<String>(json['bio']),
        profilePicture: BaseModel.getByType<String>(json['profile_picture']),
        participated: BaseModel.embeddedListFromJson<LearningSpace>(
            json['participated'], const LearningSpace()),
        created: BaseModel.embeddedListFromJson<LearningSpace>(
            json['created'], const LearningSpace()),
      );

  final String? username;
  final String? bio;
  final String? profilePicture;
  final List<LearningSpace>? participated;
  final List<LearningSpace>? created;

  @override
  GetProfileResponse fromJson(Map<String, dynamic> json) =>
      GetProfileResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'username': username,
        'bio': bio,
        'profile_picture': profilePicture,
        'participated': participated,
        'created': created,
      };

  @override
  List<Object?> get props => <Object?>[
        username,
        bio,
        profilePicture,
        participated,
        created,
      ];
}
