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

  late List<Course> _takenCourses;
  List<Course> get takenCourses => _takenCourses;

  late List<Course> _friendCourses;
  List<Course> get friendCourses => _friendCourses;

  late List<Course> _recommendedCourses;
  List<Course> get recommendedCourses => _recommendedCourses;

  @override
  Future<String?> initViewModel() async {
    _homeService = HomeService.instance;
    await _getCourses();
    return null;
  }

  @override
  Future<String?> initView() async {
    _setDefault();
    if (_takenCourses.isEmpty &&
        _friendCourses.isEmpty &&
        _recommendedCourses.isEmpty) {
      await _getCourses();
    }
    return null;
  }

  @override
  void disposeView() {
    _takenCourses.clear();
    _friendCourses.clear();
    _recommendedCourses.clear();
    _setDefault();
    super.disposeView();
  }

  void _setDefault() {}

  Future<String?> _getCourses() async {
    await operation?.cancel();
    operation = CancelableOperation<String?>.fromFuture(_getCoursesRequest());
    final String? res = await operation?.valueOrCancellation();
    return res;
  }

  Future<String?> _getCoursesRequest() async {
    final IResponseModel<GetCoursesResponse> resp =
        await _homeService.getCourses();
    if (resp.hasError) return resp.error?.errorMessage;
    // ignore: cast_nullable_to_non_nullable
    _takenCourses = resp.data?.takenCourses as List<Course>;
    // ignore: cast_nullable_to_non_nullable
    _friendCourses = resp.data?.friendCourses as List<Course>;
    // ignore: cast_nullable_to_non_nullable
    _recommendedCourses = resp.data?.recommendedCourses as List<Course>;
    return null;
  }
}
