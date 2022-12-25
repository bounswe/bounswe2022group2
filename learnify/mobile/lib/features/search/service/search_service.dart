import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/ls_search_response_model.dart';
import 'i_search_service.dart';

class SearchService extends ISearchService {
  factory SearchService() => _instance;
  SearchService._();

  static final SearchService _instance = SearchService._();

  /// Static instance getter of [SearchService].
  static SearchService get instance => _instance;

  static const String _search = '/learningspace';

  @override
  Future<IResponseModel<LsSearchResponse>> searchLs(
          String searchedItem) async =>
      networkManager.send<AnyModel, LsSearchResponse>(
        _search,
        queryParameters: {"query": searchedItem},
        parseModel: const LsSearchResponse(),
        type: RequestTypes.get,
      );

  @override
  Future<IResponseModel<AnyModel>> searchUser(String searchedItem) async =>
      networkManager.send<AnyModel, AnyModel>(
        _search,
        queryParameters: {"query": searchedItem},
        parseModel: const AnyModel(),
        type: RequestTypes.get,
      );
}
