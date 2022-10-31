import '../../../core/base/service/base_service.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/course_model.dart';

/// Abstract base class for home service, defines the required functions.
abstract class IHomeService extends BaseService {
  /// Gets the courses
  Future<IResponseModel<Course>> getCourses();
}
