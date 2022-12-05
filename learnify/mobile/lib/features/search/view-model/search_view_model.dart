import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../model/search_response_model.dart';
import '../service/i_search_service.dart';
import '../service/search_service.dart';

/// View model to manage the data on search screen.
class SearchViewModel extends BaseViewModel {
  late final ISearchService _searchService;

  late TextEditingController _searchController;
  TextEditingController get searchController => _searchController;

  late List<LearningSpace> _resultLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get resultLearningSpaces => _resultLearningSpaces;

  late bool didResultCome = false;

  @override
  void initViewModel() {
    _searchService = SearchService.instance;
  }

  @override
  void initView() {
    _searchController = TextEditingController();
    _searchController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeView() {
    _searchController.dispose();
    _resultLearningSpaces = <LearningSpace>[];
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}

  void clearResultLearningSpaces() {
    _searchController.clear();
    _resultLearningSpaces = <LearningSpace>[];
  }

  Future<void> _controllerListener() async {
    if (searchController.text.isEmpty) return;
    notifyListeners();
  }

  Future<String?> search() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_searchRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _searchRequest() async {
    final IResponseModel<SearchResponse> resp =
        await _searchService.search(_searchController.text);

    final SearchResponse? respData = resp.data;
    if (resp.hasError || respData == null) return resp.error?.errorMessage;
    _resultLearningSpaces = respData.resultLearningSpaces;

    notifyListeners();
    return null;
  }

  void setDefault() {
    _resultLearningSpaces = [];
    didResultCome = false;
  }
}
