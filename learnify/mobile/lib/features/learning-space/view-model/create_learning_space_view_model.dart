import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../product/constants/storage_keys.dart';
import '../models/categories_response_model.dart';
import '../models/create_ls_request_model.dart';
import '../models/create_ls_response_model.dart';
import '../models/learning_space_model.dart';
import '../service/l_ls_service.dart';
import '../service/ls_service.dart';

class CreateLearningSpaceViewModel extends BaseViewModel {
  //CreateLearningSpaceViewModel(this._learningSpace);

  LearningSpace? _learningSpace;

  late final ILSService _lsService;
  static List<String> categoryOptions = <String>[];

  late TextEditingController _titleController;
  TextEditingController get titleController => _titleController;
  String? _initialTitle;

  late TextEditingController _descriptionController;
  TextEditingController get descriptionController => _descriptionController;
  String? _initialDescription;

  late TextEditingController _participantsController;
  TextEditingController get participantsController => _participantsController;
  String? _initialparticipants;

  late GlobalKey<FormState> _formKey;
  GlobalKey<FormState> get formKey => _formKey;

  late final ImagePicker _picker;
  int? _selectedImage;
  int? get selectedImage => _selectedImage;

  List<String> _selectedCategories = <String>[];
  List<String> get selectedCategoryNames => _selectedCategories;

  bool _canUpdate = false;
  bool get canUpdate => _canUpdate;

  @override
  void initViewModel() {
    _lsService = LSService.instance;
    _picker = ImagePicker();
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _formKey = GlobalKey<FormState>();
    //_setLSData();
    _titleController = TextEditingController(text: _initialTitle);
    _descriptionController = TextEditingController(text: _initialDescription);
    _participantsController = TextEditingController(text: _initialparticipants);
    _titleController.addListener(_controllerListener);
    _descriptionController.addListener(_controllerListener);
    _participantsController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _titleController.dispose();
    _descriptionController.dispose();
    _participantsController.dispose();
    _selectedCategories = <String>[];
    _setDefault();
    super.disposeView();
  }

  void _controllerListener() {
    final String newTitle = _titleController.text;
    final String newDescription = _descriptionController.text;
    final String newParticipants = _participantsController.text;
    final bool infoUpdated = (newTitle.isNotEmpty &&
            newTitle != _initialTitle) ||
        (newDescription != _initialDescription) ||
        (newParticipants.isNotEmpty && newParticipants != _initialparticipants);
    if (_canUpdate == infoUpdated) return;
    _canUpdate = infoUpdated;
    notifyListeners();
  }

  void _setDefault() {
    _canUpdate = false;
  }

  Future<String?> createLearningSpace() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_createLearningSpaceRequest());
    final String? res = await operation?.valueOrCancellation();
    _canUpdate = false;
    notifyListeners();
    return res;
  }

  Future<String?> editLearningSpace() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_editLearningSpaceRequest());
    final String? res = await operation?.valueOrCancellation();
    _canUpdate = false;
    notifyListeners();
    return res;
  }

  Future<void> fetchInitialCategories() async {
    if (categoryOptions.isNotEmpty) return;
    await _getCategories();
  }

  Future<String?> _createLearningSpaceRequest() async {
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      final CreateLSRequest request = CreateLSRequest(
        title: _titleController.text,
        description: _descriptionController.text,
        categories: _selectedCategories,
      );
      final IResponseModel<CreateLSResponse> response =
          await _lsService.createLS(request);
      if (response.hasError) return response.error?.errorMessage;
      final LearningSpace? ls = response.data?.learningSpace;
      if (ls == null) return "Learning Space not created";
      await navigationManager.navigateToPage(
        path: NavigationConstants.learningSpace,
      );
      _canUpdate = false;
      notifyListeners();
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
      _canUpdate = false;
      notifyListeners();
    }
    return null;
  }

  void addCategory(String cName) {
    final int indexOfItem =
        _selectedCategories.indexWhere((String c) => c == cName);
    if (indexOfItem != -1) return;
    final List<String> newSelectedCategories =
        List<String>.from(_selectedCategories)..add(cName);
    _selectedCategories = newSelectedCategories;
    _canUpdate = true;
    notifyListeners();
  }

  void removeCategory(String cName) {
    final int indexOfItem =
        _selectedCategories.indexWhere((String c) => c == cName);
    if (indexOfItem == -1) return;
    final List<String> newSelectedCategories =
        List<String>.from(_selectedCategories)..remove(cName);
    _selectedCategories = newSelectedCategories;
    _canUpdate = true;
    notifyListeners();
  }

  Future<String?> _getCategories() async {
    final IResponseModel<CategoriesResponse> response =
        await _lsService.getCategories();
    final CategoriesResponse? data = response.data;
    if (response.hasError || data == null) return response.error?.errorMessage;
    categoryOptions = data.categories;
    notifyListeners();
    return null;
  }
/*
  void _setLSData() {
    _initialTitle = _learningSpace?.title;
    _initialDescription = _learningSpace?.description;
    _selectedCategories =
        _learningSpace == null ? _learningSpace!.categories : <String>[];
    _selectedImage = _learningSpace?.iconId;
  }
  */
}
