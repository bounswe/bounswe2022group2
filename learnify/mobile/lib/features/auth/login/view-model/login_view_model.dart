import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../../core/managers/network/models/message_response.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../../product/constants/storage_keys.dart';
import '../../forget-password/model/send_verification_request_model.dart';
import '../../service/auth_service.dart';
import '../../service/l_auth_service.dart';
import '../../verification/model/user_model.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

/// View model to manage the data on login screen.
class LoginViewModel extends BaseViewModel {
  late final IAuthService _authService;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  bool _canLogin = false;
  bool get canLogin => _canLogin;

  @override
  void initViewModel() {
    _authService = AuthService.instance;
  }

  @override
  void initView() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _emailController.addListener(_controllerListener);
    _passwordController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _emailController.dispose();
    _passwordController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final bool newCanLogin =
        _passwordController.text.isNotEmpty && _emailController.text.isNotEmpty;
    if (_canLogin == newCanLogin) return;
    _canLogin = newCanLogin;
    notifyListeners();
  }

  /// login callback.
  Future<String?> login() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_loginRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _loginRequest() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      final LoginRequest requestModel = LoginRequest(
          email: _emailController.text, password: _passwordController.text);
      final IResponseModel<LoginResponse> res =
          await _authService.login(requestModel);
      if (res.error?.statusCode == 401) {
        final SendVerificationRequest requestModel =
            SendVerificationRequest(email: _emailController.text);
        final IResponseModel<MessageResponse> resp =
            await _authService.sendVerification(requestModel);
        if (resp.hasError) return resp.error?.errorMessage;
        await navigationManager.navigateToPage(
            path: NavigationConstants.verify,
            data: <String, dynamic>{'email': _emailController.text});
      } else if (res.hasError) {
        return res.error?.errorMessage;
      } else {
        final User? user = res.data?.user;
        if (user == null) return "User couldn't fetch";
        await localManager.setModel(user, StorageKeys.user);
        await navigationManager.navigateToPageClear(
            path: NavigationConstants.home,
            data: <String, dynamic>{'user': user.toJson});
      }
    }
    return null;
  }

  /// Callback for don't have account text press.
  Future<void> dontHaveAccount() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_asyncDontHaveAccount());
  }

  Future<String?> _asyncDontHaveAccount() async {
    await navigationManager.navigateToPage(
        path: NavigationConstants.signup, checkHistory: true);
    return null;
  }

  void _setDefault() {
    _canLogin = false;
  }
}
