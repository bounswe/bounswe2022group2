import '../../../core/base/model/base_model.dart';
import 'profile_model.dart';

class UpdateProfileResponse extends BaseModel<UpdateProfileResponse> {
  const UpdateProfileResponse({
    this.resultMessage,
    this.profile,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse(
        resultMessage: BaseModel.getByType<String>(json['resultMessage']),
        profile: BaseModel.getByType<Profile>(json['profile']),
      );

  final String? resultMessage;
  final Profile? profile;

  @override
  UpdateProfileResponse fromJson(Map<String, dynamic> json) =>
      UpdateProfileResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'profile': profile,
      };

  @override
  List<Object?> get props => <Object?>[
        resultMessage,
        profile,
      ];
}
