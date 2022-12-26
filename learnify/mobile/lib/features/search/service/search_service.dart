import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/ls_search_response_model.dart';
import '../model/user_search_response_model.dart';
import 'i_search_service.dart';

class SearchService extends ISearchService {
  factory SearchService() => _instance;
  SearchService._();

  static final SearchService _instance = SearchService._();

  /// Static instance getter of [SearchService].
  static SearchService get instance => _instance;

  static const String _searchLS = '/learningspace';
  static const String _searchUser = '/user/search';

  @override
  Future<IResponseModel<LsSearchResponse>> searchLs(
          String searchedItem) async =>
      networkManager.send<AnyModel, LsSearchResponse>(
        _searchLS,
        queryParameters: {"query": searchedItem},
        parseModel: const LsSearchResponse(),
        type: RequestTypes.get,
      );

  @override
  Future<IResponseModel<UserSearchResponse>> searchUser(
          String searchedItem) async =>
      networkManager.send<AnyModel, UserSearchResponse>(
        '$_searchUser/$searchedItem',
        parseModel: const UserSearchResponse(),
        type: RequestTypes.get,
      );
}
