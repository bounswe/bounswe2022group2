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

  bool _readAgreed = false;

  @override
  void initViewModel() {}

  @override
  void initView() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void disposeView() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.disposeView();
  }

  /// Signup callback.
  Future<String?> signup() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_signupRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _signupRequest() async {
    // TODO: Fix
    return null;

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

  void readAgreeChange(bool val) {
    if (_readAgreed == val) return;
    _readAgreed = val;
    notifyListeners();
  }
}
