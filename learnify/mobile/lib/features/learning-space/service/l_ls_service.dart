import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../models/add_post_request_model.dart';
import '../models/annotation/annotation_model.dart';
import '../models/annotation/get_annotations_response.dart';
import '../models/categories_response_model.dart';
import '../models/create_ls_request_model.dart';
import '../models/create_ls_response_model.dart';
import '../models/edit_post_request_model.dart';
import '../models/enroll_ls_request_model.dart';
import '../models/enroll_ls_response_model.dart';

/// Abstract base class for auth service, defines the required functions.
abstract class ILSService extends BaseService {
  /// Creates a new learning space
  Future<IResponseModel<CreateLSResponse>> createLS(CreateLSRequest body);
  Future<IResponseModel<CategoriesResponse>> getCategories();
  Future<IResponseModel<EnrollLSResponse>> enrollLS(EnrollLSRequest body);
  Future<IResponseModel<EnrollLSResponse>> addPost(AddPostRequestModel body);
  Future<IResponseModel<EnrollLSResponse>> editPost(EditPostRequestModel body);
  Future<IResponseModel<GetAnnotationsResponse>> getAnnotations(
      String lsId, String postId);
  Future<IResponseModel<Annotation>> createAnnotation(
      Annotation body, String lsId, String postId);
}
