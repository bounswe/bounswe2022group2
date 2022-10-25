import '../../../../core/base/model/base_model.dart';

/// LoginRequest model.
class LoginRequest extends BaseModel<LoginRequest> {
  /// Default constructor.
  const LoginRequest({
    this.email,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: BaseModel.getByType<String>(json['email']),
        password: BaseModel.getByType<String>(json['password']),
      );

  /// Email String.
  final String? email;

  /// Password String.
  final String? password;

  @override
  LoginRequest fromJson(Map<String, dynamic> json) =>
      LoginRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => <Object?>[email, password];
}
