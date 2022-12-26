import '../../../core/base/model/base_model.dart';
import 'profile_without_lists_model.dart';

class UpdateProfileResponse extends BaseModel<UpdateProfileResponse> {
  const UpdateProfileResponse({
    this.resultMessage,
    this.profile,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse(
        resultMessage: BaseModel.getByType<String>(json['resultMessage']),
        profile:
            BaseModel.embeddedModelFromJson<ProfileThatResponseOfUpdateProfile>(
                json['profile'], const ProfileThatResponseOfUpdateProfile()),
      );

  final String? resultMessage;
  final ProfileThatResponseOfUpdateProfile? profile;

  @override
  UpdateProfileResponse fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'profile':
            BaseModel.embeddedModelToJson<ProfileThatResponseOfUpdateProfile>(
                profile),
      };

  @override
  List<Object?> get props => <Object?>[
        resultMessage,
        profile,
      ];
}
