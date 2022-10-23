import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:dio/src/adapters/io_adapter.dart'
    if (dart.library.html) 'package:dio/src/adapters/browser_adapter.dart'
    as adapter;

import '../../base/model/base_model.dart';
import '../../constants/enums/request_types.dart';
import '../../constants/network_constants.dart';
import 'helpers/network_parsers.dart';
import 'l_network_manager.dart';
import 'models/_response_model.dart';
import 'models/error_model.dart';
import 'models/response_model.dart';

/// Implementation of the network manager.
class NetworkManager extends INetworkManager
    with
        // ignore: prefer_mixin
        dio.DioMixin
    implements
        dio.Dio {
  /// Returns the singleton instance of the network manager.
  factory NetworkManager() => _instance;

  /// Init constructor of the [NetworkManager].
  NetworkManager._init() {
    options = BaseOptions(
      // TODO: Fix
      baseUrl: NetworkConstants.localhostUrl,
      contentType: 'application/json',
      connectTimeout: 10000,
      receiveTimeout: 6000,
    );

    // TODO: Fix
    // AuthenticationService(
    //   networkManager: this,
    //   authLocalManager: AuthLocalManager(),
    // );
    // interceptors.add(CustomInterceptors());
    httpClientAdapter = adapter.createAdapter();
  }

  static final NetworkManager _instance = NetworkManager._init();

  /// Returns the singleton instance of the network manager.
  static NetworkManager get instance => _instance;

  @override
  Future<IResponseModel<R>>
      send<T extends BaseModel<T>, R extends BaseModel<R>>(
    String path, {
    required RequestTypes type,
    required R parseModel,
    T? body,
    Map<String, dynamic>? queryParameters,
    bool requireAuth = true,
    String? customBaseUrl,
    Options? customOptions,
    CancelToken? canceltoken,
    String? listKey,
  }) async {
    try {
      // TODO: Fix
      options.baseUrl = NetworkConstants.localhostUrl;
      customOptions ??= Options();
      customOptions
        ..method = type.name
        ..extra ??= <String, dynamic>{}
        ..headers ??= <String, dynamic>{};
      final Response<dynamic> response = await request(
        path,
        data: body?.toJson,
        options: customOptions,
        queryParameters: queryParameters,
        cancelToken: canceltoken,
      );
      final dio.Response<Map<String, dynamic>> responseData =
          dio.Response<Map<String, dynamic>>(
        requestOptions: response.requestOptions,
        extra: response.extra,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        data: response.data is Map<String, dynamic>
            ? response.data
            : <String, dynamic>{listKey ?? '-list-': response.data},
      );
      return successReturn<R>(responseData, parseModel);
    } on DioError catch (error) {
      return errorReturn<R>(error);
    } on Exception catch (error) {
      return ResponseModel<R>(
        error: ErrorModel(
            customErrorMessage: 'Exception Is Occurred: ${error.toString()}'),
      );
    } finally {
      // TODO: Fix
      options.baseUrl = NetworkConstants.localhostUrl;
    }
  }

  @override
  IResponseModel<R> successReturn<R extends BaseModel<R>>(
    Response<Map<String, dynamic>> response,
    R parseModel,
  ) {
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
      case HttpStatus.accepted:
        final R? responseModel =
            NetworkParsers.responseParser<R>(parseModel, response);
        if (responseModel != null) return ResponseModel<R>(data: responseModel);
        return _defaultRes<R>('Unexpected Return Type.');
      default:
        return _defaultRes<R>('Undetermined Error Is Occurred');
    }
  }

  @override
  IResponseModel<R> errorReturn<R extends BaseModel<R>>(DioError error) {
    String errorMessage = error.message;
    try {
      if (error.response?.data is Map<String, dynamic>) {
        final Map<String, dynamic> resMap = error.response?.data;
        errorMessage = resMap['message'] ?? error.response?.data.toString();
      }
    } on Exception catch (_) {
      errorMessage = error.toString();
    }
    return _defaultRes<R>(errorMessage, dioError: error);
  }

  static ResponseModel<R> _defaultRes<R>(
    String message, {
    DioError? dioError,
  }) =>
      ResponseModel<R>(
        error: ErrorModel(
          customErrorMessage: message,
          dioError: dioError,
          isAuthentication: dioError?.response?.statusCode == 403,
        ),
      );
}
