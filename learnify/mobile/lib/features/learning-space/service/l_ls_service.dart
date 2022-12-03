import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../models/annotation/create_annotation_request.dart';
import '../models/categories_response_model.dart';
import '../models/create_ls_request_model.dart';
import '../models/create_ls_response_model.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';

/// Abstract base class for auth service, defines the required functions.
abstract class ILSService extends BaseService {
  /// Creates a new learning space
  Future<IResponseModel<CreateLSResponse>> createLS(CreateLSRequest body);
  Future<IResponseModel<CategoriesResponse>> getCategories();
  Future<IResponseModel<EnrollLSResponse>> enrollLS(EnrollLSRequest body);
  Future<IResponseModel<AnyModel>> annotate(CreateAnnotationRequest body);
}