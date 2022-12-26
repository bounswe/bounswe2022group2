import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../product/constants/icon_keys.dart';
import '../../auth/verification/model/user_model.dart';
import '../../home/model/get_learning_spaces_response_model.dart';
import '../../home/service/I_home_service.dart';
import '../../home/service/home_service.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../model/ls_search_response_model.dart';
import '../model/user_search_response_model.dart';
import '../service/i_search_service.dart';
import '../service/search_service.dart';
import '../view/search_screen.dart';

/// View model to manage the data on search screen.
class SearchViewModel extends BaseViewModel {
  late final ISearchService _searchService;
  late final IHomeService _homeService;

  late TextEditingController _searchController;
  TextEditingController get searchController => _searchController;

  late List<LearningSpace> _resultLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get resultLearningSpaces => _resultLearningSpaces;

  late List<LearningSpace> _recommendedLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get recommendedLearningSpaces =>
      _recommendedLearningSpaces;

  late final List<UserPreview> allUsers = <UserPreview>[
    const UserPreview(
        userName: "Altay Akar", profilePhoto: IconKeys.profilePageAltay),
    const UserPreview(
        userName: "Bahrican Kırmızı",
        profilePhoto: IconKeys.profilePageBahrican),
    const UserPreview(
        userName: "Batuhan Nikel", profilePhoto: IconKeys.profilePageBatuhan),
    const UserPreview(
        userName: "Ezgi Doğu", profilePhoto: IconKeys.profilePageEzgi),
    const UserPreview(
        userName: "Ecenur Sezar", profilePhoto: IconKeys.profilePageEce),
    const UserPreview(
        userName: "Egemen Yavaş", profilePhoto: IconKeys.profilePageEgemen),
    const UserPreview(
        userName: "Enes Sürmesiz", profilePhoto: IconKeys.profilePageEnes),
    const UserPreview(
        userName: "Hasan Askerol", profilePhoto: IconKeys.profilePageHasan),
    const UserPreview(
        userName: "Onur Karboncu", profilePhoto: IconKeys.profilePageOnur),
    const UserPreview(
        userName: "Gökay Güneş", profilePhoto: IconKeys.profilePageGokay),
    const UserPreview(
        userName: "Koray Tekçık", profilePhoto: IconKeys.profilePageKoray),
  ];

  late List<UserPreview> _resultUsers = allUsers;
  List<UserPreview> get resultUsers => _resultUsers;

  //late bool didResultCome = false;

  @override
  void initViewModel() {
    _searchService = SearchService.instance;
    _homeService = HomeService.instance;
  }

  @override
  void initView() {
    _searchController = TextEditingController();
    _searchController.addListener(_controllerListener);
    _getRecommendedLearningSpaces();
  }

  @override
  void disposeView() {
    _searchController.dispose();
    _resultLearningSpaces = <LearningSpace>[];
    _recommendedLearningSpaces = <LearningSpace>[];
    //didResultCome = false;
    super.disposeView();
  }

  void clearResults() {
    _searchController.clear();
    _resultLearningSpaces = _recommendedLearningSpaces;
    _resultUsers = allUsers;
    //didResultCome = false;
    notifyListeners();
  }

  void clearUserResults() {
    _resultUsers = allUsers;
    notifyListeners();
  }

  void clearLearningSpaceResults() {
    _resultLearningSpaces = _recommendedLearningSpaces;
    notifyListeners();
  }

  Future<void> _controllerListener() async {
    if (searchController.text.isEmpty) return;
    notifyListeners();
  }

  Future<String?> _getRecommendedLearningSpaces() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(
        _getRecommendedLearningSpacesRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getRecommendedLearningSpacesRequest() async {
    final IResponseModel<GetLearningSpacesResponse> resp =
        await _homeService.getLearningSpaces();
    final GetLearningSpacesResponse? respData = resp.data;
    if (resp.hasError || respData == null) return resp.error?.errorMessage;
    _recommendedLearningSpaces = respData.learningSpaces;
    _resultLearningSpaces = _recommendedLearningSpaces;
    notifyListeners();
    return null;
  }

  Future<String?> search() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_searchRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _searchRequest() async {
    if (_searchController.text.isEmpty) {
      clearResults();
      return null;
    }
    final IResponseModel<LsSearchResponse> responseLS =
        await _searchService.searchLs(_searchController.text);
    final LsSearchResponse? respDataLS = responseLS.data;

    final IResponseModel<UserSearchResponse> responseUser =
        await _searchService.searchUser(_searchController.text);
    final UserSearchResponse? respDataUser = responseUser.data;

    if (responseLS.hasError || responseUser.hasError) {
      clearResults();
      return responseLS.error?.errorMessage;
    }
    if (respDataLS == null || respDataLS.resultLearningSpaces.isEmpty) {
      clearLearningSpaceResults();
      return null;
    }
    _resultLearningSpaces = respDataLS.resultLearningSpaces;

    if (respDataUser == null || respDataUser.users.isEmpty) {
      clearUserResults();
      return null;
    }
    _resultUsers = await _usernameToUserPreview(respDataUser.users);

    notifyListeners();
    return null;
  }

  void setDefault() {
    _resultLearningSpaces = <LearningSpace>[];
    _resultUsers = <UserPreview>[];
    //didResultCome = false;
  }

  Future<List<UserPreview>> _usernameToUserPreview(List<String> users) async {
    _resultUsers = allUsers;
    final List<UserPreview> resultUsers = <UserPreview>[];
    for (final String username in users) {
      final UserPreview userPreview = UserPreview(
          userName: username, profilePhoto: IconKeys.profilePageBatuhan);
      resultUsers.add(userPreview);
    }
    return resultUsers;
  }
}
