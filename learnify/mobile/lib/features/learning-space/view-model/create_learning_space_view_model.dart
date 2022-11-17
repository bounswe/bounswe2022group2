import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../product/constants/navigation_constants.dart';

class CreateLearningSpaceViewModel extends BaseViewModel {
  late TextEditingController _titleController;
  TextEditingController get titleController => _titleController;
  String? _initialTitle;

  late TextEditingController _descriptionController;
  TextEditingController get descriptionController => _descriptionController;
  String? _initialDescription;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  @override
  void initViewModel() {}
  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _titleController = TextEditingController(text: _initialTitle);
    _descriptionController = TextEditingController(text: _initialDescription);
    _formKey = GlobalKey<FormState>();
    _titleController.addListener(_controllerListener);
    _descriptionController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _titleController.dispose();
    _descriptionController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    notifyListeners();
  }

  void _setDefault() {}

  Future<String?> createLearningSpace() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_createLearningSpaceRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> editLearningSpace() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_editLearningSpaceRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _createLearningSpaceRequest() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      //post request
      await navigationManager.navigateToPage(
        path: NavigationConstants.learningSpace,
      );
    }
    return null;
  }

  Future<String?> _editLearningSpaceRequest() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      //patch? request
      await navigationManager.navigateToPage(
        path: NavigationConstants.learningSpace,
      );
    }
    return null;
  }
}
