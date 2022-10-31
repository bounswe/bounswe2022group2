import '../../../../core/base/model/base_model.dart';
import 'user_model.dart';

class VerifyEmailResponse extends BaseModel<VerifyEmailResponse> {
  const VerifyEmailResponse({this.resultMessage, this.token, this.user});

  factory VerifyEmailResponse.fromJson(Map<String, dynamic> json) =>
      VerifyEmailResponse(
          resultMessage: BaseModel.getByType<String>(json['resultMessage']),
          token: BaseModel.getByType<String>(json['token']),
          user: BaseModel.embeddedModelFromJson<User>(
              json['user'], const User()));

  final String? resultMessage;
  final String? token;
  final User? user;

  @override
  VerifyEmailResponse fromJson(Map<String, dynamic> json) =>
      VerifyEmailResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'token': token,
        'user': BaseModel.embeddedModelToJson<User>(user)
      };

  @override
  List<Object?> get props => <Object?>[resultMessage, token, user];
}
