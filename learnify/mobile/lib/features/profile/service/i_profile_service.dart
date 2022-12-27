import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/get_profile_response_model.dart';
import '../model/update_profile_request_model.dart';
import '../model/update_profile_response_model.dart';

/// Abstract base class for search service, defines the required functions.
abstract class IProfileService extends BaseService {
  /// Search the course
  Future<IResponseModel<GetProfileResponse>> getProfileRequest(String username);
  Future<IResponseModel<UpdateProfileResponse>> updateProfileRequest(
      UpdateProfileRequest body);
}
