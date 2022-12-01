import '../../../../core/base/model/base_model.dart';

class CreateLSRequest extends BaseModel<CreateLSRequest> {
  const CreateLSRequest({
    this.token,
    this.title,
    this.description,
    this.categories,
  });

  factory CreateLSRequest.fromJson(Map<String, dynamic> json) =>
      CreateLSRequest(
        token: BaseModel.getByType<String>(json['token']),
        title: BaseModel.getByType<String>(json['title']),
        description: BaseModel.getByType<String>(json['description']),
        categories: BaseModel.getList(json['categories']),
      );

  final String? token;
  final String? title;
  final String? description;
  final List<String>? categories;

  @override
  CreateLSRequest fromJson(Map<String, dynamic> json) =>
      CreateLSRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'token': token,
        'title': title,
        'description': description,
        'categories': categories,
      };

  @override
  List<Object?> get props => <Object?>[token, title, description, categories];
}
