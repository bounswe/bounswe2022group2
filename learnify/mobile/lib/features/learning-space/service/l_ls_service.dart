import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../models/categories_response_model.dart';
import '../models/create_ls_request_model.dart';
import '../models/create_ls_response_model.dart';

/// Abstract base class for auth service, defines the required functions.
abstract class ILSService extends BaseService {
  /// Creates a new learning space
  Future<IResponseModel<CreateLSResponse>> createLS(CreateLSRequest body);
  Future<IResponseModel<CategoriesResponse>> getCategories();
}
