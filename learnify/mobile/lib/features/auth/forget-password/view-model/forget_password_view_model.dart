import 'package:async/async.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';

class ForgetPasswordViewModel extends BaseViewModel {
  late TextEditingController _emailController;

  TextEditingController get emailController => _emailController;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  bool _canVerify = false;
  bool get canVerify => _canVerify;

  @override
  void initViewModel() {}

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
      return null;
    }
    return null;
  }

  void _setDefault() {
    _canVerify = false;
  }
}
