import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/course_model.dart';
import '../model/get_courses_response_model.dart';
import 'I_home_service.dart';

/// Service for network request of home view-model.
class HomeService extends IHomeService {
  /// Factory constructor for singleton structure.
  factory HomeService() => _instance;
  HomeService._();

  static final HomeService _instance = HomeService._();

  /// Static instance getter of [HomeService].
  static HomeService get instance => _instance;

  static const String _courses = '/courses';

  @override
  Future<IResponseModel<GetCoursesResponse>> getCourses() async =>
      networkManager.send<Course, GetCoursesResponse>(_courses,
          parseModel: const GetCoursesResponse(),
          type: RequestTypes.get,
          requireAuth: false);
}
