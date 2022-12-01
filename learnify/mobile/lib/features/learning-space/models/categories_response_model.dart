import '../../../core/base/model/base_model.dart';

class CategoriesResponse extends BaseModel<CategoriesResponse> {
  const CategoriesResponse({this.categories = const <String>[]});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
          categories: BaseModel.getList<String>(json['Categories']));

  final List<String> categories;

  @override
  CategoriesResponse fromJson(Map<String, dynamic> json) =>
      CategoriesResponse.fromJson(json);

  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'Categories': BaseModel.primitiveToJson(categories),
      };

  @override
  List<Object?> get props => <Object?>[categories];
}

class CategoriesRequest extends BaseModel<CategoriesRequest> {
  @override
  Map<String, dynamic> get toJson => <String, dynamic>{};

  @override
  List<Object?> get props => <Object?>[];

  @override
  CategoriesRequest fromJson(Map<String, dynamic> json) => CategoriesRequest();
}
