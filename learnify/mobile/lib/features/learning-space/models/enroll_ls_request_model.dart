import '../../../core/base/model/base_model.dart';

class EnrollLSRequest extends BaseModel<EnrollLSRequest> {
  const EnrollLSRequest({this.title});

  factory EnrollLSRequest.fromJson(Map<String, dynamic> json) =>
      EnrollLSRequest(title: BaseModel.getByType<String>(json['title']));

  final String? title;

  @override
  EnrollLSRequest fromJson(Map<String, dynamic> json) =>
      EnrollLSRequest().fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{'title': title};

  @override
  List<Object?> get props => <Object?>[title];
}
