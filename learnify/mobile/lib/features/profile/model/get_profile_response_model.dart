import '../../../core/base/model/base_model.dart';
import '../../learning-space/models/learning_space_model.dart';
import 'profile_model.dart';

class GetProfileResponse extends BaseModel<GetProfileResponse> {
  const GetProfileResponse(
      {this.resultMessage, this.profile = const Profile()});

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetProfileResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          profile: BaseModel.embeddedModelFromJson<Profile>(
              json['profile'], const Profile()));

  final String? resultMessage;
  final Profile profile;

  @override
  GetProfileResponse fromJson(Map<String, dynamic> json) =>
      GetProfileResponse.fromJson(json);
  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'profile': BaseModel.embeddedModelToJson<Profile>(profile),
      };

  @override
  List<Object?> get props => <Object?>[
        resultMessage,
        profile,
      ];
}
