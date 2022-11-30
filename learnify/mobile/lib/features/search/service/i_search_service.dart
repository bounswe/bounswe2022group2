import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../core/managers/network/models/message_response.dart';
import '../model/search_request_model.dart';
import '../model/search_response_model.dart';

/// Abstract base class for auth service, defines the required functions.
abstract class ISearchService extends BaseService {
  /// Search the course
  Future<IResponseModel<SearchResponse>> search(SearchRequest body);
}
