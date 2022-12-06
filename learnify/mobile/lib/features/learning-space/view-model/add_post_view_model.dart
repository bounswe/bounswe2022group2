import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../models/add_post_request_model.dart';
import '../models/edit_post_request_model.dart';
import '../models/enroll_ls_response_model.dart';
import '../models/learning_space_model.dart';
import '../models/post_model.dart';
import '../service/ls_service.dart';

class AddPostViewModel extends BaseViewModel {
  late final LSService _lsService;
  Post? _post;
  Post? get post => _post;

  late TextEditingController _titleController;
  TextEditingController get titleController => _titleController;

  late TextEditingController _contentController;
  TextEditingController get contentController => _contentController;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  bool _canUpdate = false;
  bool get canUpdate => _canUpdate;

  @override
  void initViewModel() {
    _lsService = LSService.instance;
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _formKey = GlobalKey<FormState>();
    _titleController = TextEditingController(text: _post?.title ?? "");
    _contentController = TextEditingController(text: _post?.content ?? "");
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

  void setPost(Post? post) {
    _post = post;
    _titleController.removeListener(_controllerListener);
    _contentController.removeListener(_controllerListener);
    _titleController.text = post?.title ?? "";
    _contentController.text = post?.content ?? "";
    _titleController.addListener(_controllerListener);
    _contentController.addListener(_controllerListener);
  }

  void _setDefault() {
    _canUpdate = false;
  }

  Future<String?> addPost(String? lsId) async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_addPostRequest(lsId));
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _addPostRequest(String? lsId) async {
    final AddPostRequestModel request = AddPostRequestModel(
      lsId: lsId,
      title: _titleController.text,
      content: _contentController.text,
    );
    final IResponseModel<EnrollLSResponse> response =
        await _lsService.addPost(request);
    if (response.hasError) {
      return response.error?.errorMessage;
    }
    final LearningSpace? ls = response.data?.learningSpace;
    final Post post = (ls?.posts ?? <Post>[]).firstWhere((Post p) =>
        p.title == _titleController.text &&
        p.content == _contentController.text);
    _post = post;
    notifyListeners();
    if (ls == null) {
      return "Learning Space not found";
    }
    return null;
  }

  Future<String?> editPost(String? lsId) async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_editPostRequest(lsId));
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _editPostRequest(String? lsId) async {
    final EditPostRequestModel request = EditPostRequestModel(
      lsId: lsId,
      postId: _post?.id,
      title: _titleController.text,
      content: _contentController.text,
    );
    final IResponseModel<EnrollLSResponse> response =
        await _lsService.editPost(request);
    if (response.hasError) {
      return response.error?.errorMessage;
    }
    final LearningSpace? ls = response.data?.learningSpace;
    final Post post = (ls?.posts ?? <Post>[]).firstWhere((Post p) =>
        p.title == _titleController.text &&
        p.content == _contentController.text);
    _post = post;
    notifyListeners();
    if (ls == null) {
      return "Learning Space not found";
    }
    return null;
  }
}
