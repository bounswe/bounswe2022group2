import '../../../../core/base/model/base_model.dart';

class SendVerificationRequest extends BaseModel<SendVerificationRequest> {
  const SendVerificationRequest({this.email});

  factory SendVerificationRequest.fromJson(Map<String, dynamic> json) =>
      SendVerificationRequest(
          email: BaseModel.getByType<String>(json['email']));

  final String? email;

  @override
  SendVerificationRequest fromJson(Map<String, dynamic> json) =>
      SendVerificationRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{'email': email};

  @override
  List<Object?> get props => <Object?>[email];
}
