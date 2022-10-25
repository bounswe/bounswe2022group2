import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../core/managers/network/models/message_response.dart';
import '../signup/model/signup_request_model.dart';

/// Abstract base class for auth service, defines the required functions.
abstract class IAuthService extends BaseService {
  /// Sign ups the user.
  Future<IResponseModel<MessageResponse>> signup(SignupRequest body);
}
