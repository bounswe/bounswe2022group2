import 'dart:async';

import 'package:async/async.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../model/get_learning_spaces_response_model.dart';
import '../service/I_home_service.dart';
import '../service/home_service.dart';

/// View model to manage the data on home screen.
class HomeViewModel extends BaseViewModel {
  late final IHomeService _homeService;

  List<LearningSpace> _takenLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get takenLearningSpaces => _takenLearningSpaces;

  List<LearningSpace> _friendLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get friendLearningSpaces => _friendLearningSpaces;

  List<LearningSpace> _recommendedLearningSpaces = <LearningSpace>[];
  List<LearningSpace> get recommendedLearningSpaces =>
      _recommendedLearningSpaces;

  bool _takenViewAll = false;
  bool get takenViewAll => _takenViewAll;

  bool _friendViewAll = false;
  bool get friendViewAll => _friendViewAll;

  bool _recommendedViewAll = false;
  bool get recommendedViewAll => _recommendedViewAll;
  static List<Map<String, dynamic>> randomUsers = <Map<String, dynamic>>[];

  void setDefault() {
    _recommendedViewAll = false;
    _friendViewAll = false;
    _takenViewAll = false;
    _recommendedLearningSpaces = [];
    _takenLearningSpaces = [];
    _friendLearningSpaces = [];
  }

  @override
  void initViewModel() {
    _homeService = HomeService.instance;
    randomUsers = List<Map<String, dynamic>>.generate(
      70,
      (int i) => <String, dynamic>{
        'name': {"title": "Ms", "first": "Francisca", "last": "García"},
        'picture': {
          if (i % 6 == 0)
            'medium': "https://randomuser.me/api/portraits/med/women/73.jpg"
          else if (i % 6 == 1)
            'medium': "https://randomuser.me/api/portraits/med/men/71.jpg"
          else if (i % 6 == 2)
            'medium': "https://randomuser.me/api/portraits/med/women/4.jpg"
          else if (i % 6 == 3)
            'medium': "https://randomuser.me/api/portraits/med/men/6.jpg"
          else if (i % 6 == 4)
            'medium': "https://randomuser.me/api/portraits/med/women/9.jpg"
          else if (i % 6 == 5)
            'medium': "https://randomuser.me/api/portraits/med/men/12.jpg"
        }
      },
    );
  }

  @override
  void disposeViewModel() {
    _takenLearningSpaces.clear();
    _friendLearningSpaces.clear();
    _recommendedLearningSpaces.clear();
  }

  @override
  void disposeView() {
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}

  Future<void> fetchInitialLearningSpaces() async {
    // if (randomUsers.isEmpty) {
    //   final IResponseModel<AnyModel> res =
    //       await LSService.instance.randomUsers();
    //   if (res.data?.map != null) {
    //     for (final dynamic model in res.data?.map!['results']) {
    //       randomUsers.add(model as Map<String, dynamic>);
    //     }
    //   }
    // }
    await _getLearningSpaces();
    await _getTakenLearningSpaces();
  }

  Future<String?> _getLearningSpaces() async {
    await operation?.cancel();
    operation =
        CancelableOperation<String?>.fromFuture(_getLearningSpacesRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getLearningSpacesRequest() async {
    final IResponseModel<GetLearningSpacesResponse> resp =
        await _homeService.getLearningSpaces();
    final GetLearningSpacesResponse? respData = resp.data;
    if (resp.hasError || respData == null) return resp.error?.errorMessage;
    _recommendedLearningSpaces = respData.learningSpaces;
    if (_takenLearningSpaces.length > 8) _takenViewAll = true;
    if (_friendLearningSpaces.length > 8) _friendViewAll = true;
    if (_recommendedLearningSpaces.length > 8) _recommendedViewAll = true;
    return null;
  }

  Future<String?> viewAll(String learningSpacesType) async {
    await operation?.cancel();
    await _viewAllRequest(learningSpacesType);
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _viewAllRequest(String learningSpacesType) async {
    List<LearningSpace> expectedLearningSpaces;
    final IResponseModel<GetLearningSpacesResponse> resp =
        await _homeService.getLearningSpaces();
    final GetLearningSpacesResponse? respData = resp.data;
    if (resp.hasError || respData == null) {
      //return resp.error?.errorMessage;
      expectedLearningSpaces = takenLearningSpaces;
    } else {
      if (learningSpacesType == TextKeys.takenLearningSpaces) {
        expectedLearningSpaces = _takenLearningSpaces;
      } else if (learningSpacesType == TextKeys.friendLearningSpaces) {
        expectedLearningSpaces = _friendLearningSpaces;
      } else if (learningSpacesType == TextKeys.recommendedLearningSpaces) {
        expectedLearningSpaces = _recommendedLearningSpaces;
      } else {
        return "Requested type of list of LearningSpaces not found!";
      }
    }
    unawaited(navigationManager.navigateToPage(
        path: NavigationConstants.viewall,
        data: <String, dynamic>{
          'listOfLearningSpaces': expectedLearningSpaces,
          'learningSpacesType': learningSpacesType
        }));
    return null;
  }

  bool getViewAllStatus(String learningSpacesType) {
    if (learningSpacesType == TextKeys.takenLearningSpaces) {
      return _takenViewAll;
    }
    if (learningSpacesType == TextKeys.friendLearningSpaces) {
      return _friendViewAll;
    }
    if (learningSpacesType == TextKeys.recommendedLearningSpaces) {
      return _recommendedViewAll;
    }
    return false;
  }

  bool getIsEnrolled(String? title) {
    for (int i = 0; i < _takenLearningSpaces.length; i++) {
      if (_takenLearningSpaces[i].title == title) {
        return true;
      }
    }
    return false;
  }

  Future<String?> _getTakenLearningSpaces() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(
        _getTakenLearningSpacesRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getTakenLearningSpacesRequest() async {
    final IResponseModel<GetLearningSpacesResponse> resp =
        await _homeService.getTakenLearningSpaces();
    final GetLearningSpacesResponse? respData = resp.data;
    if (resp.hasError || respData == null) return resp.error?.errorMessage;
    _takenLearningSpaces = respData.learningSpaces;
    if (_takenLearningSpaces.length > 8) _takenViewAll = true;
    return null;
  }

  void addToTakenLearningSpaces(LearningSpace? learningSpace) {
    if (learningSpace != null) {
      _takenLearningSpaces.add(learningSpace);
    }
  }

  void updateLs(LearningSpace? ls) {
    if (ls == null) return;
    final int takenIndex =
        _takenLearningSpaces.indexWhere((LearningSpace l) => l.id == ls.id);
    if (takenIndex != -1) {
      final List<LearningSpace> newList =
          List<LearningSpace>.from(_takenLearningSpaces);
      newList[takenIndex] = ls;
      _takenLearningSpaces = newList;
    }
    final int friendIndex =
        _friendLearningSpaces.indexWhere((LearningSpace l) => l.id == ls.id);
    if (friendIndex != -1) {
      final List<LearningSpace> newList =
          List<LearningSpace>.from(_friendLearningSpaces);
      newList[friendIndex] = ls;
      _friendLearningSpaces = newList;
    }
    final int recommendedIndex = _recommendedLearningSpaces
        .indexWhere((LearningSpace l) => l.id == ls.id);
    if (recommendedIndex != -1) {
      final List<LearningSpace> newList =
          List<LearningSpace>.from(_recommendedLearningSpaces);
      newList[recommendedIndex] = ls;
      _recommendedLearningSpaces = newList;
    }
    notifyListeners();
  }

  void addLs(LearningSpace? ls) {
    if (ls == null) return;
    final int takenIndex =
        _takenLearningSpaces.indexWhere((LearningSpace l) => l.id == ls.id);
    if (takenIndex == -1) {
      final List<LearningSpace> newList =
          List<LearningSpace>.from(_takenLearningSpaces)..add(ls);
      _takenLearningSpaces = newList;
    }
    notifyListeners();
  }
}
