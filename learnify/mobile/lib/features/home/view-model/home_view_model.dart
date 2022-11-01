import 'package:async/async.dart';

import '../../../../core/base/view-model/base_view_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
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

  @override
  void initViewModel() {
    _homeService = HomeService.instance;
    // await _getCourses();
  }

  @override
  void disposeView() {
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {
    _takenCourses.clear();
    _friendCourses.clear();
    _recommendedCourses.clear();
  }

  Future<String?> getCourses() async {
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
    return null;
  }
}
