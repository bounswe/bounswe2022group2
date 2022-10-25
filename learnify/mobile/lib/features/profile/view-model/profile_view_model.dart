import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../product/constants/storage_keys.dart';

/// View model to manage the data on profile screen.
class ProfileViewModel extends BaseViewModel {
  late final ImagePicker _picker;

  late TextEditingController _usernameController;
  TextEditingController get usernameController => _usernameController;

  String? _selectedImage;
  String? get selectedImage => _selectedImage;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  late String _email = '';
  String get email => _email;

  bool _canUpdate = false;
  bool get canUpdate => _canUpdate;

  @override
  void initViewModel() {
    _picker = ImagePicker();
  }

  @override
  void initView() {
    // TODO: Fix
    _formKey = GlobalKey<FormState>();
    // TODO: Fix
    _email = localManager.getString(StorageKeys.email) ?? _email;
    final String? initialUsername =
        localManager.getString(StorageKeys.username);
    _usernameController = TextEditingController(text: initialUsername);
    _usernameController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _usernameController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final bool newCanSignup = _usernameController.text.isNotEmpty;
    if (_canUpdate == newCanSignup) return;
    _canUpdate = newCanSignup;
    notifyListeners();
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

  void _setDefault() {
    _canUpdate = false;
  }
}
