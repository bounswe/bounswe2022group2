import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../model/get_learning_spaces_response_model.dart';
import '../model/learning_space_model.dart';
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
  Future<IResponseModel<GetLearningSpacesResponse>> getLearningSpaces() async =>
      networkManager.send<LearningSpace, GetLearningSpacesResponse>(_courses,
          parseModel: const GetLearningSpacesResponse(),
          type: RequestTypes.get,
          requireAuth: false);
}
