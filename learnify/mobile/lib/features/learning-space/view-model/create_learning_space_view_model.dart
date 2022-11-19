import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../../product/constants/navigation_constants.dart';
import '../view/create_learning_space_screen.dart';

class CreateLearningSpaceViewModel extends BaseViewModel {
  static final List<Category> categoryOptions = <Category>[
    Category(categoryName: "Art"),
    Category(categoryName: "Music"),
    Category(categoryName: "Dance"),
    Category(categoryName: "Cooking"),
    Category(categoryName: "Programming"),
    Category(categoryName: "Technology"),
    Category(categoryName: "Knitting"),
    Category(categoryName: "Science"),
    Category(categoryName: "Math"),
    Category(categoryName: "Coffee"),
    Category(categoryName: "Yoga"),
    Category(categoryName: "Sports"),
    Category(categoryName: "Acting"),
    Category(categoryName: "Writing"),
    Category(categoryName: "Board Games"),
    Category(categoryName: "Esports"),
    Category(categoryName: "Chess"),
    Category(categoryName: "Bartending"),
    Category(categoryName: "Baking"),
    Category(categoryName: "Magic"),
    Category(categoryName: "Astronomy"),
    Category(categoryName: "Fishing"),
    Category(categoryName: "Gardening"),
    Category(categoryName: "Hobbies"),
    Category(categoryName: "Outdoors"),
    Category(categoryName: "Educational"),
    Category(categoryName: "Photography"),
  ];

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
  List<String> _selectedCategories = <String>[];
  List<String> get selectedCategoryNames => _selectedCategories;

  bool _canUpdate = false;
  bool get canUpdate => _canUpdate;

  @override
  void initViewModel() {
    _picker = ImagePicker();
  }

  @override
  void disposeViewModel() {}

  @override
  void initView() {
    _titleController = TextEditingController(text: _initialTitle);
    _descriptionController = TextEditingController(text: _initialDescription);
    _participantsController = TextEditingController(text: _initialparticipants);
    _formKey = GlobalKey<FormState>();
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
    notifyListeners();
  }

  void removeCategory(String cName) {
    final int indexOfItem =
        _selectedCategories.indexWhere((String c) => c == cName);
    if (indexOfItem == -1) return;
    final List<String> newSelectedCategories =
        List<String>.from(_selectedCategories)..remove(cName);
    _selectedCategories = newSelectedCategories;
    notifyListeners();
  }
}
