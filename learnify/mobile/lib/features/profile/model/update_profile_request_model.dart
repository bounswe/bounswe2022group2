import '../../../core/base/model/base_model.dart';

class UpdateProfileRequest extends BaseModel<UpdateProfileRequest> {
  const UpdateProfileRequest({this.bio, this.profilePicture});

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      UpdateProfileRequest(
          bio: BaseModel.getByType<String>(json['bio']),
          profilePicture: BaseModel.getByType<String>(json['profile_picture']));

  final String? bio;
  final String? profilePicture;

  @override
  UpdateProfileRequest fromJson(Map<String, dynamic> json) =>
      UpdateProfileRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson =>
      <String, dynamic>{'bio': bio, 'profile_picture': profilePicture};

  @override
  List<Object?> get props => <Object?>[bio, profilePicture];
}
