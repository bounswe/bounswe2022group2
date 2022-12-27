import '../../../../core/base/model/base_model.dart';

class ProfileThatResponseOfUpdateProfile
    extends BaseModel<ProfileThatResponseOfUpdateProfile> {
  const ProfileThatResponseOfUpdateProfile({
    this.username,
    this.profilePicture,
    this.bio,
  });

  factory ProfileThatResponseOfUpdateProfile.fromJson(
          Map<String, dynamic> json) =>
      ProfileThatResponseOfUpdateProfile(
        username: BaseModel.getByType<String>(json['username']),
        profilePicture: BaseModel.getByType<String>(json['profile_picture']),
        bio: BaseModel.getByType<String>(json['bio']),
      );

  ProfileThatResponseOfUpdateProfile copyWith({
    String? username,
    String? profilePicture,
    String? bio,
  }) =>
      ProfileThatResponseOfUpdateProfile(
        username: username ?? this.username,
        profilePicture: profilePicture ?? this.profilePicture,
        bio: bio ?? this.bio,
      );

  final String? username;
  final String? profilePicture;
  final String? bio;

  @override
  ProfileThatResponseOfUpdateProfile fromJson(Map<String, dynamic> json) =>
      ProfileThatResponseOfUpdateProfile.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'username': username,
        'profile_picture': profilePicture,
        'bio': bio,
      };

  @override
  List<Object?> get props => <Object?>[
        username,
        profilePicture,
        bio,
      ];
}
