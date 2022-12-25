import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/get_profile_response_model.dart';
import '../model/update_profile_request_model.dart';
import 'i_profile_service.dart';

class ProfileService extends IProfileService {
  factory ProfileService() => _instance;
  ProfileService._();

  static final ProfileService _instance = ProfileService._();

  /// Static instance getter of [ProfileService].
  static ProfileService get instance => _instance;

  static const String _getProfile = '/user';
  static const String _updateProfile = '/user';

  @override
  Future<IResponseModel<GetProfileResponse>> getProfileRequest(
          String username) async =>
      networkManager.send<GetProfileResponse, GetProfileResponse>(
          '$_getProfile/$username',
          parseModel: const GetProfileResponse(),
          type: RequestTypes.get);

  @override
  Future<IResponseModel<GetProfileResponse>> updateProfileRequest(
          UpdateProfileRequestModel body) async =>
      networkManager.send<UpdateProfileRequestModel, GetProfileResponse>(
        _updateProfile,
        parseModel: const GetProfileResponse(),
        type: RequestTypes.put,
        body: body,
      );
}
