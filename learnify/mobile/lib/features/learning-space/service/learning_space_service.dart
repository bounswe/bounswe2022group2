import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/any_model.dart';
import '../../../core/managers/network/network_manager.dart';

/// Service for network request of learning space view-model.
class LearningSpaceService {
  /// Factory constructor for singleton structure.
  factory LearningSpaceService() => _instance;
  LearningSpaceService._();

  static final LearningSpaceService _instance = LearningSpaceService._();

  /// Static instance getter of [LearningSpaceService].
  static LearningSpaceService get instance => _instance;

  static const String _randomUserData = 'https://randomuser.me/api/?results=50';

  Future<IResponseModel<AnyModel>> randomUsers() async =>
      NetworkManager.instance.send<AnyModel, AnyModel>(
        _randomUserData,
        parseModel: const AnyModel(),
        type: RequestTypes.get,
        requireAuth: false,
      );
}
