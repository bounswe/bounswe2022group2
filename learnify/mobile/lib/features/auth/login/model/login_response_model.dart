import '../../../../core/base/model/base_model.dart';
import 'user_model.dart';

class LoginResponse extends BaseModel<LoginResponse> {
  const LoginResponse({this.resultMessage, this.token, this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
      resultMessage: BaseModel.getByType<String>(json['resultMessage']),
      token: BaseModel.getByType<String>(json['token']),
      user: BaseModel.embeddedModelFromJson<User>(json['user'], const User()));

  final String? resultMessage;
  final String? token;
  final User? user;

  @override
  LoginResponse fromJson(Map<String, dynamic> json) =>
      LoginResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'resultMessage': resultMessage,
        'token': token,
        'user': BaseModel.embeddedModelToJson<User>(user)
      };

  @override
  List<Object?> get props => <Object?>[resultMessage, token, user];
}
