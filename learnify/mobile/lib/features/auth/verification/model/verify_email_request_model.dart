import '../../../../core/base/model/base_model.dart';

class VerifyEmailRequest extends BaseModel<VerifyEmailRequest> {
  const VerifyEmailRequest({this.email, this.code});

  factory VerifyEmailRequest.fromJson(Map<String, dynamic> json) =>
      VerifyEmailRequest(
          email: BaseModel.getByType<String>(json['email']),
          code: BaseModel.getByType<String>(json['code']));

  final String? email;
  final String? code;

  @override
  VerifyEmailRequest fromJson(Map<String, dynamic> json) =>
      VerifyEmailRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson =>
      <String, dynamic>{'email': email, 'code': code};

  @override
  List<Object?> get props => <Object?>[email, code];
}
