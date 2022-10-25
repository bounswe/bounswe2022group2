import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../../core/managers/network/models/message_response.dart';
import '../../../../core/widgets/buttons/action_button.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../../product/constants/storage_keys.dart';
import '../../service/auth_service.dart';
import '../../service/l_auth_service.dart';
import '../model/signup_request_model.dart';

/// View model to manage the data on signup screen.
class SignupViewModel extends BaseViewModel {
  late final IAuthService _authService;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get usernameController => _usernameController;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  late GlobalKey<ActionButtonState> _actionButtonKey;
  GlobalKey<ActionButtonState> get actionButtonKey => _actionButtonKey;

  bool _acceptedAgreement = false;
  bool get acceptedAgreement => _acceptedAgreement;

  bool _canSignup = false;
  bool get canSignup => _canSignup && _acceptedAgreement;

  @override
  void initViewModel() {
    _authService = AuthService.instance;
  }

  @override
  void initView() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _actionButtonKey = GlobalKey<ActionButtonState>();
    _emailController.addListener(_controllerListener);
    _passwordController.addListener(_controllerListener);
    _usernameController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final bool newCanSignup = _passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty;
    if (_canSignup == newCanSignup) return;
    _canSignup = newCanSignup;
    notifyListeners();
  }

  /// Signup callback.
  Future<String?> signup() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_signupRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _signupRequest() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid && _acceptedAgreement) {
      final SignupRequest requestModel = SignupRequest(
          email: _emailController.text,
          password: _passwordController.text,
          username: _usernameController.text);
      final IResponseModel<MessageResponse> res =
          await _authService.signup(requestModel);
      if (res.hasError) return res.error?.errorMessage;
      // TODO: Fix
      await localManager.setString(StorageKeys.email, _emailController.text);
      await localManager.setString(
          StorageKeys.username, _usernameController.text);
      await navigationManager.navigateToPageClear(
          path: NavigationConstants.home);
    }
    return null;
  }

  /// Callback for have account text press.
  Future<void> haveAccount() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_asyncHaveAccount());
  }

  Future<String?> _asyncHaveAccount() async {
    await navigationManager.navigateToPage(path: NavigationConstants.login);
    return null;
  }

  /// Callback for have account text press.
  void onPasswordSubmit(_) => _actionButtonKey.currentState?.localOnPressed();

  void setAcceptedAgreement(bool val) {
    if (_acceptedAgreement == val) return;
    _acceptedAgreement = val;
    notifyListeners();
  }

  void _setDefault() {
    _canSignup = false;
    _acceptedAgreement = false;
  }
}
