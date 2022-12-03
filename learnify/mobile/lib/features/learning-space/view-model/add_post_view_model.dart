import 'package:flutter/cupertino.dart';

import '../../../core/base/view-model/base_view_model.dart';
import '../models/post_model.dart';

class AddPostViewModel extends BaseViewModel {
  Post? post;

  late TextEditingController _titleController;
  TextEditingController get titleController => _titleController;

  late TextEditingController _contentController;
  TextEditingController get contentController => _contentController;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  bool _canUpdate = false;
  bool get canUpdate => _canUpdate;

  @override
  void initViewModel() {}

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController(text: post?.title ?? "");
    _contentController = TextEditingController(text: post?.content ?? "");
    _titleController.addListener(_controllerListener);
    _contentController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _titleController.dispose();
    _contentController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final String newTitle = _titleController.text;
    final String newContent = _contentController.text;
    final bool infoUpdated = newTitle.isNotEmpty && newContent.isNotEmpty;
    if (_canUpdate == infoUpdated) return;
    _canUpdate = infoUpdated;
    notifyListeners();
  }

  void _setDefault() {
    _canUpdate = false;
  }
}
