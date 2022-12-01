import '../../../core/base/model/base_model.dart';
import '../view/create_learning_space_screen.dart';

class CategoriesResponse extends BaseModel<CategoriesResponse> {
  const CategoriesResponse({this.categories = const <Category>[]});

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) =>
      CategoriesResponse(
          categories: BaseModel.getList<Category>(json['Categories']));

  final List<Category> categories;

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
