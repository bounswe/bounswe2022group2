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
import '../model/user_model.dart';
import '../model/verify_email_request_model.dart';
import '../model/verify_email_response_model.dart';

class VerificationViewModel extends BaseViewModel {
  late final IAuthService _authService;
  late String email;
  late TextEditingController _verificationCodeFirstDigitController;
  late TextEditingController _verificationCodeSecondDigitController;
  late TextEditingController _verificationCodeThirdDigitController;
  late TextEditingController _verificationCodeFourthDigitController;

  TextEditingController get verificationCodeFirstDigitController =>
      _verificationCodeFirstDigitController;
  TextEditingController get verificationCodeSecondDigitController =>
      _verificationCodeSecondDigitController;
  TextEditingController get verificationCodeThirdDigitController =>
      _verificationCodeThirdDigitController;
  TextEditingController get verificationCodeFourthDigitController =>
      _verificationCodeFourthDigitController;

  bool _canVerify = false;
  bool get canVerify => _canVerify;

  @override
  void initViewModel() {
    _authService = AuthService.instance;
  }

  @override
  void initView() {
    _verificationCodeFirstDigitController = TextEditingController();
    _verificationCodeFirstDigitController.addListener(_controllerListener);
    _verificationCodeSecondDigitController = TextEditingController();
    _verificationCodeSecondDigitController.addListener(_controllerListener);
    _verificationCodeThirdDigitController = TextEditingController();
    _verificationCodeThirdDigitController.addListener(_controllerListener);
    _verificationCodeFourthDigitController = TextEditingController();
    _verificationCodeFourthDigitController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _verificationCodeFirstDigitController.dispose();
    _verificationCodeSecondDigitController.dispose();
    _verificationCodeThirdDigitController.dispose();
    _verificationCodeFourthDigitController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final bool newCanVerify =
        _verificationCodeFirstDigitController.text.isNotEmpty &&
            _verificationCodeSecondDigitController.text.isNotEmpty &&
            _verificationCodeThirdDigitController.text.isNotEmpty &&
            _verificationCodeFourthDigitController.text.isNotEmpty;
    if (_canVerify == newCanVerify) return;
    _canVerify = newCanVerify;
    notifyListeners();
  }

  Future<String?> verification() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_verificationRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _verificationRequest() async {
    final String verificationCode = _verificationCodeFirstDigitController.text +
        _verificationCodeSecondDigitController.text +
        _verificationCodeThirdDigitController.text +
        _verificationCodeFourthDigitController.text;
    final VerifyEmailRequest requestModel =
        VerifyEmailRequest(email: email, code: verificationCode);
    final IResponseModel<VerifyEmailResponse> resp =
        await _authService.verifyEmail(requestModel);
    if (resp.hasError) return resp.error?.errorMessage;
    final User? user = resp.data?.user;
    if (user == null) return "User couldn't fetch";
    await localManager.setModel(user, StorageKeys.user);
    await navigationManager.navigateToPageClear(
        path: NavigationConstants.home,
        data: <String, dynamic>{'user': user.toJson});
    return null;
  }

  Future<String?> resendCode() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_resendCodeRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _resendCodeRequest() async {
    final SendVerificationRequest requestModel =
        SendVerificationRequest(email: email);

    final IResponseModel<MessageResponse> resp =
        await _authService.sendVerification(requestModel);
    if (resp.hasError) return resp.error?.errorMessage;
    return null;
  }

  void _setDefault() {
    _canVerify = false;
  }
}
