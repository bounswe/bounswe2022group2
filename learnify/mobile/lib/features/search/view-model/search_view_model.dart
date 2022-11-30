import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../home/model/get_learning_spaces_response_model.dart';
import '../../home/model/learning_space_model.dart';
import '../../home/service/I_home_service.dart';
import '../../home/service/home_service.dart';

/// View model to manage the data on home screen.
class SearchViewModel extends BaseViewModel {
  late final IHomeService _homeService;
  late TextEditingController _searchController;

  TextEditingController get searchController => _searchController;

  late final List<LearningSpace> _resultLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get resultLearningSpaces => _resultLearningSpaces;

  @override
  void initViewModel() {
    //_homeService = HomeService.instance;
  }

  @override
  void initView() {
    _searchController = TextEditingController();
    _searchController.addListener(_controllerListener);
    _setDefault();
  }

  @override
  void disposeViewModel() {
    _resultLearningSpaces.clear();
    _searchController.clear();
  }

  @override
  void disposeView() {
    _searchController.dispose();
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}

  Future<void> _controllerListener() async {
    if (searchController.text.isEmpty) return;
    notifyListeners();
  }

  Future<String?> getLearningSpaces() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_getLearningSpacesRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getLearningSpacesRequest() async {
    final String searchedLearningSpace = _searchController.text;
    /*
    final IResponseModel<GetLearningSpacesResponse> resp =
        await _homeService.getLearningSpaces();
    final GetLearningSpacesResponse? respData = resp.data;
    if (resp.hasError || respData == null) return resp.error?.errorMessage;
    _takenLearningSpaces = respData.takenLearningSpaces;
    _friendLearningSpaces = respData.friendLearningSpaces;
    _recommendedLearningSpaces = respData.recommendedLearningSpaces;
    */
    return null;
  }
}
