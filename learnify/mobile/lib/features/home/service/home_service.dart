import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/models/l_response_model.dart';
import '../../learning-space/models/learning_space_model.dart';
import '../model/get_learning_spaces_response_model.dart';
import 'I_home_service.dart';

/// Service for network request of home view-model.
class HomeService extends IHomeService {
  /// Factory constructor for singleton structure.
  factory HomeService() => _instance;
  HomeService._();

  static final HomeService _instance = HomeService._();

  /// Static instance getter of [HomeService].
  static HomeService get instance => _instance;

  static const String _learningspaces = '/learningspace';
  static const String _takenLearningSpaces = '/learningspace/user/participated';

  @override
  Future<IResponseModel<GetLearningSpacesResponse>> getLearningSpaces() async =>
      networkManager.send<AnyModel, GetLearningSpacesResponse>(_learningspaces,
          parseModel: const GetLearningSpacesResponse(),
          type: RequestTypes.get,
          requireAuth: false);

  @override
  Future<IResponseModel<GetLearningSpacesResponse>>
      getTakenLearningSpaces() async =>
          networkManager.send<AnyModel, GetLearningSpacesResponse>(
            _takenLearningSpaces,
            parseModel: const GetLearningSpacesResponse(),
            type: RequestTypes.get,
          );
}
