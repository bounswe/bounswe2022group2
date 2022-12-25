import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../product/constants/storage_keys.dart';
import '../../auth/verification/model/user_model.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../model/get_profile_response_model.dart';
import '../model/profile_model.dart';
import '../service/i_profile_service.dart';
import '../service/profile_service.dart';

/// View model to manage the data on profile screen.
class ProfileViewModel extends BaseViewModel {
  ProfileViewModel(this._user, this._profile);
  User _user;
  User get user => _user;

  Profile _profile;
  Profile get profile => _profile;
  late final ImagePicker _picker;

  late final IProfileService _profileService;

  late TextEditingController _usernameController;
  TextEditingController get usernameController => _usernameController;
  String? _initialUsername;

  late TextEditingController _biographyController;
  TextEditingController get biographyController => _biographyController;
  String? _initialBiography;

  String? _selectedImage;
  String? get selectedImage => _selectedImage;

  late GlobalKey<FormState> _userFormKey;
  GlobalKey<FormState> get userFormKey => _userFormKey;

  late GlobalKey<FormState> _biographyFormKey;
  GlobalKey<FormState> get biographyFormKey => _biographyFormKey;

  String? _email;
  String? get email => _email;

  List<LearningSpace> _enrolledLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get enrolledLearningSpaces => _enrolledLearningSpaces;

  List<LearningSpace> _createdLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get createdLearningSpaces => _createdLearningSpaces;

  bool _canUpdate = false;
  bool get canUpdate => _canUpdate;

  void setDefault() {
    _canUpdate = false;
    _email = null;
    _selectedImage = null;
    _initialUsername = null;
    _initialBiography = null;
  }

  @override
  void initViewModel() {
    _picker = ImagePicker();
  }

  @override
  void initView() {
    _userFormKey = GlobalKey<FormState>();
    _biographyFormKey = GlobalKey<FormState>();
    // TODO: Fix
    _setUserData();
    _selectedImage = localManager.getString(StorageKeys.profilePhoto);
    _usernameController = TextEditingController(text: _initialUsername);
    _usernameController.addListener(_controllerListener);
    _biographyController = TextEditingController(text: _initialBiography);
    _biographyController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _usernameController.dispose();
    _biographyController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final String newUsername = _usernameController.text;
    final String newBiography = _biographyController.text;
    final bool isUpdated =
        (newUsername.isNotEmpty && newUsername != _initialUsername) ||
            (newBiography.isNotEmpty && newBiography != _initialBiography);
    if (_canUpdate == isUpdated) return;
    _canUpdate = isUpdated;
    notifyListeners();
  }

  void _setUserData() {
    _email = _user.email;
    _initialUsername = _user.username;
  }

  Future<String?> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null || _selectedImage == pickedFile.path) return null;
      _canUpdate = true;
      _selectedImage = pickedFile.path;
      notifyListeners();
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateProfile() async {
    final bool isUsernameValid = userFormKey.currentState?.validate() ?? false;
    if (isUsernameValid) {
      _initialUsername = _usernameController.text;
      _user = _user.copyWith(username: _usernameController.text);
      await localManager.setModel(_user, StorageKeys.user);
      if (_selectedImage != null) {
        await localManager.setString(StorageKeys.profilePhoto, _selectedImage!);
      }
      _canUpdate = false;
      notifyListeners();
    }

    final bool isBiographyValid =
        biographyFormKey.currentState?.validate() ?? false;
    if (isBiographyValid) {
      _initialBiography = _biographyController.text;
      if (_selectedImage != null) {
        await localManager.setString(StorageKeys.profilePhoto, _selectedImage!);
      }
      _canUpdate = false;
      notifyListeners();
    }

    return null;
  }

  void _setDefault() {
    _canUpdate = false;
  }

  void updateUser(User newUser) {
    if (newUser == _user) return;
    _user = newUser;
    _setUserData();
    notifyListeners();
  }

  Future<String?> getProfile() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_getProfile());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getProfile() async {
    final String? username = _user.username;
    if (username != null) {
      final IResponseModel<GetProfileResponse> res =
          await _profileService.getProfile(username);
      final GetProfileResponse? respData = res.data;
      if (res.hasError || respData == null) {
        return res.error?.errorMessage;
      }
      _user.username = respData.username;
    }

    _setUserData();
    notifyListeners();
    return null;
  }
}
