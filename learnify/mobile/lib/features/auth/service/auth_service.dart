import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/message_response.dart';
import '../signup/model/signup_request_model.dart';
import 'l_auth_service.dart';

/// Service for network request of auth view-model.
class AuthService extends IAuthService {
  /// Factory constructor for singleton structure.
  factory AuthService() => _instance;
  AuthService._();

  static final AuthService _instance = AuthService._();

  /// Static instance getter of [AuthService].
  static AuthService get instance => _instance;

  static const String _signup = '/auth/signup';

  @override
  Future<IResponseModel<MessageResponse>> signup(SignupRequest body) async =>
      networkManager.send<SignupRequest, MessageResponse>(
        _signup,
        parseModel: const MessageResponse(),
        type: RequestTypes.post,
        body: body,
        requireAuth: false,
      );
}