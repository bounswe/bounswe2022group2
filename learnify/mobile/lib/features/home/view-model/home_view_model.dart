import 'package:async/async.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../../product/constants/navigation_constants.dart';
import '../model/course_model.dart';
import '../model/get_courses_response_model.dart';
import '../service/I_home_service.dart';
import '../service/home_service.dart';

/// View model to manage the data on home screen.
class HomeViewModel extends BaseViewModel {
  late final IHomeService _homeService;

  List<Course> _takenCourses = <Course>[];
  List<Course> get takenCourses => _takenCourses;

  List<Course> _friendCourses = <Course>[];
  List<Course> get friendCourses => _friendCourses;

  List<Course> _recommendedCourses = <Course>[];
  List<Course> get recommendedCourses => _recommendedCourses;

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
    _takenCourses.clear();
    _friendCourses.clear();
    _recommendedCourses.clear();
  }

  @override
  void disposeView() {
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}

  Future<void> fetchInitialCourses() async {
    if (_takenCourses.isNotEmpty ||
        _friendCourses.isNotEmpty ||
        _recommendedCourses.isNotEmpty) return;
    await _getCourses();
  }

  Future<String?> _getCourses() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_getCoursesRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getCoursesRequest() async {
    final IResponseModel<GetCoursesResponse> resp =
        await _homeService.getCourses();
    final GetCoursesResponse? respData = resp.data;
    if (resp.hasError || respData == null) return resp.error?.errorMessage;
    _takenCourses = respData.takenCourses;
    _friendCourses = respData.friendCourses;
    _recommendedCourses = respData.recommendedCourses;
    if (_takenCourses.length > 8) _takenViewAll = true;
    if (_friendCourses.length > 8) _friendViewAll = true;
    if (_recommendedCourses.length > 8) _recommendedViewAll = true;
    return null;
  }

  Future<String?> viewAll(String coursesType) async {
    await operation?.cancel();
    if (coursesType == "Taken Courses") {
      operation = CancelableOperation<String?>.fromFuture(
          _viewAllResponse(takenCourses));
    } else if (coursesType == "Friends Courses") {
      operation = CancelableOperation<String?>.fromFuture(
          _viewAllResponse(friendCourses));
    } else if (coursesType == "Recommended Courses") {
      operation = CancelableOperation<String?>.fromFuture(
          _viewAllResponse(recommendedCourses));
    }
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _viewAllResponse(List<Course> expectedCourses) async {
    await navigationManager.navigateToPage(
        path: NavigationConstants.viewall,
        data: <String, dynamic>{'courses': expectedCourses});
    return null;
  }

  bool getViewAllStatus(String coursesType) {
    if (coursesType == "Taken Courses") return _takenViewAll;
    if (coursesType == "Friends Courses") return _friendViewAll;
    if (coursesType == "Recommended Courses") return _recommendedViewAll;
    return false;
  }
}
