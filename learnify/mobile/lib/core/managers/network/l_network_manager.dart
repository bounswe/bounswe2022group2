import 'package:dio/dio.dart';

import '../../base/model/base_model.dart';
import '../../constants/enums/request_types.dart';
import 'models/l_response_model.dart';

/// Defines the base network manager functionalities.
abstract class INetworkManager {
  /// Sends a request, <T, R>.
  /// * T: Body Model
  /// * R: Result Parse Model
  Future<IResponseModel<R>>
      send<T extends BaseModel<T>, R extends BaseModel<R>>(
    String path, {
    required RequestTypes type,
    required R parseModel,
    T? body,
    Map<String, Object>? queryParameters,
    bool requireAuth = true,
    String? customBaseUrl,
    Options? customOptions,
    CancelToken? canceltoken,
    String? listKey,
  });

  /// Return function for the success case.
  IResponseModel<R> successReturn<R extends BaseModel<R>>(
      Response<Map<String, dynamic>> response, R parseModel);

  /// Return function for the error case.
  IResponseModel<R> errorReturn<R extends BaseModel<R>>(DioError error);
}
