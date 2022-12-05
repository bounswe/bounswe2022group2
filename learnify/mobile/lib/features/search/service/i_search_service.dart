import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/search_response_model.dart';

/// Abstract base class for search service, defines the required functions.
abstract class ISearchService extends BaseService {
  /// Search the course
  Future<IResponseModel<SearchResponse>> search(String searchedItem);
}
