import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../../core/managers/network/models/message_response.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../../product/constants/storage_keys.dart';
import '../../service/auth_service.dart';
import '../../service/l_auth_service.dart';
import '../model/send_verification_request_model.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  late final IAuthService _authService;

  late TextEditingController _emailController;

  TextEditingController get emailController => _emailController;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  bool _canVerify = false;
  bool get canVerify => _canVerify;

  @override
  void initViewModel() {
    _authService = AuthService.instance;
  }

  @override
  void initView() {
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _emailController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _emailController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final bool newCanVerify = _emailController.text.isNotEmpty;
    if (_canVerify == newCanVerify) return;
    _canVerify = newCanVerify;
    notifyListeners();
  }

  Future<String?> forgetPassword() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_forgetPasswordRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _forgetPasswordRequest() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      final SendVerificationRequest requestModel =
          SendVerificationRequest(email: _emailController.text);

      final IResponseModel<MessageResponse> resp =
          await _authService.sendVerification(requestModel);
      if (resp.hasError) return resp.error?.errorMessage;
      await navigationManager.navigateToPage(
          path: NavigationConstants.verify,
          data: <String, dynamic>{'email': _emailController.text});
    }
    return null;
  }

  void _setDefault() {
    _canVerify = false;
  }
}
