import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/get_profile_response_model.dart';
import '../model/update_profile_request_model.dart';
import '../model/update_profile_response_model.dart';
import 'i_profile_service.dart';

class ProfileService extends IProfileService {
  factory ProfileService() => _instance;
  ProfileService._();

  static final ProfileService _instance = ProfileService._();

  /// Static instance getter of [ProfileService].
  static ProfileService get instance => _instance;

  static const String _user = '/user';

  @override
  Future<IResponseModel<GetProfileResponse>> getProfileRequest(
          String username) async =>
      networkManager.send<GetProfileResponse, GetProfileResponse>(
          '$_user/$username',
          parseModel: const GetProfileResponse(),
          type: RequestTypes.get);

  @override
  Future<IResponseModel<UpdateProfileResponse>> updateProfileRequest(
          UpdateProfileRequest body) async =>
      networkManager.send<UpdateProfileRequest, UpdateProfileResponse>(
        _user,
        parseModel: const UpdateProfileResponse(),
        type: RequestTypes.put,
        body: body,
      );
}
