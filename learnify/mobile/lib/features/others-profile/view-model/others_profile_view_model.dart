import 'package:async/async.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../../profile/model/get_profile_response_model.dart';
import '../../profile/model/profile_model.dart';
import '../../profile/service/i_profile_service.dart';
import '../../profile/service/profile_service.dart';

/// View model to manage the data on profile screen.
class OthersProfileViewModel extends BaseViewModel {
  OthersProfileViewModel();

  late Profile _profile = const Profile(
    username: "",
  );
  Profile get profile => _profile;

  late final IProfileService _profileService = ProfileService.instance;

  void setDefault() {}

  @override
  void initViewModel() {}

  @override
  void initView() {
    _setDefault();
  }

  @override
  void disposeView() {
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}

  Future<String?> getProfile(String username) async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_getProfileRequest(username));
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getProfileRequest(String username) async {
    final IResponseModel<GetProfileResponse> res =
        await _profileService.getProfileRequest(username);
    final GetProfileResponse? respData = res.data;

    if (res.hasError || respData == null) {
      return res.error?.errorMessage;
    }
    _profile = Profile(
      username: respData.username,
      bio: respData.bio,
      profilePicture: respData.profilePicture,
      participated: respData.participated ?? <LearningSpace>[],
      created: respData.created ?? <LearningSpace>[],
    );
    print(_profile.profilePicture);
    notifyListeners();
    return null;
  }
}
