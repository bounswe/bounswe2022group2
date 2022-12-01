import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/search_request_model.dart';
import '../model/search_response_model.dart';
import 'i_search_service.dart';

class SearchService extends ISearchService {
  factory SearchService() => _instance;
  SearchService._();

  static final SearchService _instance = SearchService._();

  /// Static instance getter of [SearchService].
  static SearchService get instance => _instance;

  static const String _search = '/learningspace';

  @override
  Future<IResponseModel<SearchResponse>> search(SearchRequest body) async =>
      networkManager.send<SearchRequest, SearchResponse>(_search,
          parseModel: const SearchResponse(),
          type: RequestTypes.post,
          body: body,
          requireAuth: false);
}
