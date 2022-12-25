import '../../../core/base/model/base_model.dart';

class UpdateProfileRequestModel extends BaseModel<UpdateProfileRequestModel> {
  const UpdateProfileRequestModel({this.bio, this.profilePicture});

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileRequestModel(
          bio: BaseModel.getByType<String>(json['ls_id']),
          profilePicture: BaseModel.getByType<String>(json['post_id']));

  final String? bio;
  final String? profilePicture;

  @override
  UpdateProfileRequestModel fromJson(Map<String, dynamic> json) =>
      UpdateProfileRequestModel.fromJson(json);

  @override
  Map<String, dynamic> get toJson =>
      <String, dynamic>{'bio': bio, 'profile_picture': profilePicture};

  @override
  List<Object?> get props => <Object?>[bio, profilePicture];
}
