import '../../../../core/base/model/base_model.dart';
import '../../auth/verification/model/user_model.dart';
import '../../learning-space/models/learning_space_model.dart';

class Profile extends BaseModel<Profile> {
  const Profile({
    this.username,
    this.email,
    this.profilePicture,
    this.bio,
    this.participated = const <LearningSpace>[],
    this.created = const <LearningSpace>[],
  });
/*
  factory Profile.dummy(String username) => Profile(
        username: username,
        email: 'dummy@gmail.com',
        profilePicture: 'example',
        bio: "this is a dummy profile",
        participated: <LearningSpace>[
          LearningSpace.dummy(0),
          LearningSpace.dummy(1)
        ],
        created: <LearningSpace>[
          LearningSpace.dummy(2),
          LearningSpace.dummy(3)
        ],
      );
*/
  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: BaseModel.getByType<String>(json['username']),
        email: BaseModel.getByType<String>(json['email']),
        profilePicture: BaseModel.getByType<String>(json['profile_picture']),
        bio: BaseModel.getByType<String>(json['bio']),
        participated: BaseModel.embeddedListFromJson<LearningSpace>(
            json['participated'], const LearningSpace()),
        created: BaseModel.embeddedListFromJson<LearningSpace>(
            json['created'], const LearningSpace()),
      );

  Profile copyWith({
    String? username,
    String? email,
    String? profilePicture,
    String? bio,
    List<LearningSpace>? participated,
    List<LearningSpace>? created,
  }) =>
      Profile(
        username: username ?? this.username,
        email: email ?? this.email,
        profilePicture: profilePicture ?? this.profilePicture,
        bio: bio ?? this.bio,
        participated: participated ?? this.participated,
        created: created ?? this.created,
      );

  final String? username;
  final String? email;
  final String? profilePicture;
  final String? bio;
  final List<LearningSpace> participated;
  final List<LearningSpace> created;

  @override
  Profile fromJson(Map<String, dynamic> json) => Profile.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'username': username,
        'email': email,
        'profile_picture': profilePicture,
        'bio': bio,
        'participated':
            BaseModel.embeddedListToJson<LearningSpace>(participated),
        'created': BaseModel.embeddedListToJson<LearningSpace>(created),
      };

  @override
  List<Object?> get props => <Object?>[
        username,
        email,
        profilePicture,
        bio,
        participated,
        created,
      ];
}
