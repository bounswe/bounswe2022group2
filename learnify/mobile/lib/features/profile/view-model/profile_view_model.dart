import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../product/constants/storage_keys.dart';
import '../../auth/verification/model/user_model.dart';
import '../../learning-space/models/learning_space_model.dart';

/// View model to manage the data on profile screen.
class ProfileViewModel extends BaseViewModel {
  ProfileViewModel(this._user);
  User _user;
  User get user => _user;
  late final ImagePicker _picker;

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

  List<LearningSpace> _learningSpaces = <LearningSpace>[];
  List<LearningSpace> get learningSpaces => _learningSpaces;

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
    _biographyController = TextEditingController(text: _initialUsername);
    _biographyController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _usernameController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final String newText = _usernameController.text;
    final bool newCanSignup = newText.isNotEmpty && newText != _initialUsername;
    if (_canUpdate == newCanSignup) return;
    _canUpdate = newCanSignup;
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
      _initialUsername = _usernameController.text;
      _user = _user.copyWith(username: _usernameController.text);
      await localManager.setModel(_user, StorageKeys.user);
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
}
