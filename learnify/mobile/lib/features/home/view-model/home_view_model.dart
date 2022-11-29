import 'package:async/async.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/learning_space_model.dart';
import '../model/get_learning_spaces_response_model.dart';
import '../../../product/constants/navigation_constants.dart';
import '../../../product/language/language_keys.dart';
import '../model/course_model.dart';
import '../model/get_courses_response_model.dart';
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

  @override
  void initViewModel() {
    _homeService = HomeService.instance;
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
    if (_takenLearningSpaces.isNotEmpty ||
        _friendLearningSpaces.isNotEmpty ||
        _recommendedLearningSpaces.isNotEmpty) return;
    await _getLearningSpaces();
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
    _takenLearningSpaces = respData.takenLearningSpaces;
    _friendLearningSpaces = respData.friendLearningSpaces;
    _recommendedLearningSpaces = respData.recommendedLearningSpaces;
    if (_takenCourses.length > 8) _takenViewAll = true;
    if (_friendCourses.length > 8) _friendViewAll = true;
    if (_recommendedCourses.length > 8) _recommendedViewAll = true;
    return null;
  }

  Future<String?> viewAll(String coursesType) async {
    await operation?.cancel();
    await _viewAllRequest(coursesType);
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _viewAllRequest(String coursesType) async {
    List<Course> expectedCourses;
    final IResponseModel<GetCoursesResponse> resp =
        await _homeService.getCourses();
    final GetCoursesResponse? respData = resp.data;
    if (resp.hasError || respData == null) {
      //return resp.error?.errorMessage;
      expectedCourses = takenCourses;
    } else {
      if (coursesType == TextKeys.takenCourses) {
        expectedCourses = respData.takenCourses;
      } else if (coursesType == TextKeys.friendCourses) {
        expectedCourses = respData.friendCourses;
      } else if (coursesType == TextKeys.recommendedCourses) {
        expectedCourses = respData.recommendedCourses;
      } else {
        return "Requested type of list of courses not found!";
      }
    }
    await navigationManager.navigateToPage(
        path: NavigationConstants.viewall,
        data: <String, dynamic>{
          'listOfCourses': expectedCourses,
          'courseType': coursesType
        });
    return null;
  }

  bool getViewAllStatus(String coursesType) {
    if (coursesType == TextKeys.takenCourses) return _takenViewAll;
    if (coursesType == TextKeys.friendCourses) return _friendViewAll;
    if (coursesType == TextKeys.recommendedCourses) return _recommendedViewAll;
    return false;
  }
}
