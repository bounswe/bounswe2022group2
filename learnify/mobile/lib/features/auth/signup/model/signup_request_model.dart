import '../../../../core/base/model/base_model.dart';

/// SignupRequest model.
class SignupRequest extends BaseModel<SignupRequest> {
  /// Default constructor.
  const SignupRequest({
    this.email,
    this.username,
    this.password,
  });

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        email: BaseModel.getByType<String>(json['email']),
        password: BaseModel.getByType<String>(json['password']),
        username: BaseModel.getByType<String>(json['username']),
      );

  /// Email String.
  final String? email;

  /// Password String.
  final String? password;

  /// username.
  final String? username;

  @override
  SignupRequest fromJson(Map<String, dynamic> json) =>
      SignupRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'email': email,
        'password': password,
        'username': username,
      };

  @override
  List<Object?> get props => <Object?>[email, password, username];
}
