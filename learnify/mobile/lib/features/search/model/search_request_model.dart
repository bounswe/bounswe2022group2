import '../../../../core/base/model/base_model.dart';

/// LoginRequest model.
class SearchRequest extends BaseModel<SearchRequest> {
  const SearchRequest({
    this.searchedItem,
  });

  factory SearchRequest.fromJson(Map<String, dynamic> json) => SearchRequest(
        searchedItem: BaseModel.getByType<String>(json['query']),
      );

  final String? searchedItem;

  @override
  SearchRequest fromJson(Map<String, dynamic> json) =>
      SearchRequest.fromJson(json);
  @override
  Map<String, dynamic> get toJson => <String, dynamic>{
        'query': searchedItem,
      };

  @override
  List<Object?> get props => <Object?>[searchedItem];
}
