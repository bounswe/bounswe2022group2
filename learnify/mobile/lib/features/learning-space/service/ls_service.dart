import '../../../../core/managers/network/models/l_response_model.dart';
import '../../../core/constants/enums/request_types.dart';
import '../../../core/managers/network/models/message_response.dart';
import '../models/create_ls_request_model.dart';
import '../models/create_ls_response_model.dart';
import 'l_ls_service.dart';

/// Service for network request of auth view-model.
class LSService extends ILSService {
  /// Factory constructor for singleton structure.
  factory LSService() => _instance;
  LSService._();

  static final LSService _instance = LSService._();

  /// Static instance getter of [LSService].
  static LSService get instance => _instance;

  static const String _create = '/learningSpace';

  @override
  Future<IResponseModel<CreateLSResponse>> createLS(
          CreateLSRequest body) async =>
      networkManager.send<CreateLSRequest, CreateLSResponse>(
        _create,
        parseModel: const CreateLSResponse(),
        type: RequestTypes.post,
        body: body,
        requireAuth: false,
      );
}
