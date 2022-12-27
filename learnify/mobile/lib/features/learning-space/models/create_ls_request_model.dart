import '../../../../core/base/model/base_model.dart';

class CreateLSRequest extends BaseModel<CreateLSRequest> {
  const CreateLSRequest({
    this.title,
    this.description,
    this.categories,
    this.iconId,
  });

  factory CreateLSRequest.fromJson(Map<String, dynamic> json) =>
      CreateLSRequest(
          title: BaseModel.getByType<String>(json['title']),
          description: BaseModel.getByType<String>(json['description']),
          categories: BaseModel.getList(json['categories']),
          iconId: BaseModel.getByType<int>(json['icon_id']));

  final String? title;
  final String? description;
  final List<String>? categories;
  final int? iconId;

  @override
  CreateLSRequest fromJson(Map<String, dynamic> json) =>
      CreateLSRequest.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'title': title,
        'description': description,
        'categories': categories,
        'icon_id': iconId
      };

  @override
  List<Object?> get props => <Object?>[title, description, categories, iconId];
}
