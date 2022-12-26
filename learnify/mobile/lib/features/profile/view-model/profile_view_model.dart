import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
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
import '../model/update_profile_request_model.dart';
import '../model/update_profile_response_model.dart';
import '../service/profile_service.dart';
import '../service/i_profile_service.dart';

/// View model to manage the data on profile screen.
class ProfileViewModel extends BaseViewModel {
  ProfileViewModel(this._user);
  final User _user;

  late Profile _profile = Profile(
    username: "",
    email: _user.email,
  );
  Profile get profile => _profile;

  late final ImagePicker _picker;
  late bool _isImagePicked = false;

  late final IProfileService _profileService;

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

  bool _canUpdate = false;
  bool get canUpdate => _canUpdate;

  void setDefault() {
    _canUpdate = false;
    _email = null;
    _selectedImage = null;
    _initialBiography = null;
  }

  @override
  void initViewModel() {
    _profileService = ProfileService.instance;
    _picker = ImagePicker();
  }

  @override
  void initView() {
    getProfile();
    _userFormKey = GlobalKey<FormState>();
    _biographyFormKey = GlobalKey<FormState>();
    _selectedImage = localManager.getString(StorageKeys.profilePhoto);
    _biographyController = TextEditingController(text: _initialBiography);
    _biographyController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _biographyController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final String newBiography = _biographyController.text;
    final bool isUpdated = _isImagePicked ||
        (newBiography.isNotEmpty && newBiography != _initialBiography);
    if (_canUpdate == isUpdated) return;
    _canUpdate = isUpdated;
    notifyListeners();
  }

  Future<String?> pickImage(ImageSource source) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile == null || _selectedImage == pickedFile.path) return null;
      _canUpdate = true;
      final Uint8List bytes = File(pickedFile.path).readAsBytesSync();
      final String base64Image = "data:image/png;base64,${base64Encode(bytes)}";
      _isImagePicked = true;
      _selectedImage = base64Image;
      notifyListeners();
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String?> updateProfile() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_updateProfileRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _updateProfileRequest() async {
    _canUpdate = false;
    final bool isBiographyValid =
        biographyFormKey.currentState?.validate() ?? false;
    if (!isBiographyValid) return null;
    final UpdateProfileRequest request = UpdateProfileRequest(
      bio: _biographyController.text, //_selectedImage,
    );

    final IResponseModel<UpdateProfileResponse> response =
        await _profileService.updateProfileRequest(request);
    final UpdateProfileResponse? respData = response.data;

    if (response.hasError || respData == null) {
      print('error: ${response.error?.errorMessage}');
      return response.error?.errorMessage;
    }
    print('respData: $respData');
    final Profile? responseProfile = respData.profile;
    if (responseProfile != null) {
      _profile = Profile(
        username: responseProfile.username,
        email: _user.email,
        bio: responseProfile.bio,
        profilePicture: responseProfile.profilePicture,
        participated: responseProfile.participated,
        created: responseProfile.created,
      );
      notifyListeners();
    }
    return null;
/*
    if (_selectedImage != null) {
      await localManager.setString(StorageKeys.profilePhoto, _selectedImage!);
    }
*/
  }

  void _setDefault() {
    _canUpdate = false;
  }

  Future<String?> getProfile() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_getProfileRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getProfileRequest() async {
    final String? username = _user.username;
    if (username != null) {
      final IResponseModel<GetProfileResponse> res =
          await _profileService.getProfileRequest(username);
      final GetProfileResponse? respData = res.data;

      if (res.hasError || respData == null) {
        return res.error?.errorMessage;
      }
      _profile = Profile(
        username: respData.username,
        email: _user.email,
        bio: respData.bio,
        profilePicture: respData.profilePicture,
        participated: respData.participated ?? <LearningSpace>[],
        created: respData.created ?? <LearningSpace>[],
      );
      _canUpdate = false;
      notifyListeners();

      //print(respData);
      //_setUserData(respData);

      //_profile = respData.profile;
      //_selectedImage = base64.decode(_profile.profilePicture!);

      //_enrolledLearningSpaces = _profile.participated;
      //_createdLearningSpaces = _profile.created;
    }
    return null;
  }
}
