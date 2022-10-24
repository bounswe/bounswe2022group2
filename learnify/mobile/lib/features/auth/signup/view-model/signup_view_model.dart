import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../product/constants/navigation_constants.dart';

/// View model to manage the data on signup screen.
class SignupViewModel extends BaseViewModel {
  // TODO: Fix
  // late final IAuthService _authService;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get usernameController => _usernameController;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  bool _acceptedAgreement = false;
  bool get acceptedAgreement => _acceptedAgreement;

  bool _canSignup = false;
  bool get canSignup => _canSignup && _acceptedAgreement;

  @override
  void initViewModel() {}

  @override
  void initView() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    _emailController.addListener(_controllerListener);
    _passwordController.addListener(_controllerListener);
    _usernameController.addListener(_controllerListener);
  }

  @override
  void disposeView() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
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
      // TODO: Sign up request
      return null;
    }
    return 'NOT VALID';

    // final IResponseModel<MessageResponse> res =
    //     await _authService.signup(_requestModel);
    // if (res.hasError) return res.error?.errorMessage;
    // await navigationManager.setNewRoutePath(const ScreenConfig.emailSent());
    // return null;
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

  void setAcceptedAgreement(bool val) {
    if (_acceptedAgreement == val) return;
    _acceptedAgreement = val;
    notifyListeners();
  }
}
