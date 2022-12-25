import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/get_profile_response_model.dart';
import 'i_profile_service.dart';

class ProfileService extends IProfileService {
  factory ProfileService() => _instance;
  ProfileService._();

  static final ProfileService _instance = ProfileService._();

  /// Static instance getter of [ProfileService].
  static ProfileService get instance => _instance;

  static const String _getProfile = '/profile';

  @override
  Future<IResponseModel<GetProfileResponse>> getProfileRequest(
          String username) async =>
      networkManager.send<AnyModel, GetProfileResponse>(_getProfile,
          parseModel: const GetProfileResponse(),
          queryParameters: {'username': username},
          requireAuth: false,
          type: RequestTypes.get);
}
