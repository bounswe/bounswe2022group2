import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../product/constants/navigation_constants.dart';
import '../../../product/constants/storage_keys.dart';
import '../../constants/durations.dart';
import '../../extensions/string/string_extensions.dart';
import '../local/local_manager.dart';
import '../navigation/navigation_manager.dart';

/// Customized interceptors.
class CustomInterceptors extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final Map<String, dynamic>? renewedHeaders = _setHeaders(options);
    log('REQUEST => Path: ${options.path} - Method: ${options.method}');
    options.headers.addAll(renewedHeaders ?? <String, dynamic>{});
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) async {
    try {
      final Map<String, dynamic> map = response.data is Map
          ? response.data
          : jsonDecode(response.data) ?? <String, dynamic>{};
      if (map['token'] != null) await _storeToken(map['token']);
    } on Exception catch (e) {
      log(e.toString());
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log("""ERROR[${err.response?.statusCode}] =>PATH:${err.requestOptions.path}\nDetails: ${err.response?.data ?? err.message}""");
    if (_tokenResCheck(err.response)) _navigateToLogin();
    return super.onError(err, handler);
  }

  bool _tokenResCheck(Response<dynamic>? response) {
    final Map<String, dynamic> resBody =
        response?.data is Map ? response?.data : <String, dynamic>{};
    final String message =
        resBody['resultMessage'] is String ? resBody['resultMessage'] : '';
    final int? statusCode = response?.statusCode;
    return (statusCode == 401 ||
            statusCode == 403 ||
            message.compareWithoutCase('Access denied: Token is invalid')) &&
        !(response?.requestOptions.path.contains('/login') ?? false);
  }

  Map<String, dynamic>? _setHeaders(RequestOptions options) {
    const String authHeader = "require_auth";
    final Map<String, dynamic> localHeaders =
        Map<String, dynamic>.from(options.extra);
    if (localHeaders.containsKey(authHeader)) {
      localHeaders.remove(authHeader);
      final String? token = _tokenCheck;
      if (token == null) return null;
      localHeaders.addAll(<String, String>{'Authorization': 'Bearer $token'});
    }
    return localHeaders;
  }

  String? get _tokenCheck {
    final String? token = getStoredToken;
    if (token == null) {
      _navigateToLogin();
      return null;
    }
    return token;
  }

  /// Token check helper.
  static String? get getStoredToken {
    final DateTime accessExpires = DateTime.fromMillisecondsSinceEpoch(
        LocalManager.instance.getInt(StorageKeys.accessTokenExpires) ??
            DateTime.now().millisecondsSinceEpoch);
    final DateTime compareDate =
        DateTime.now().add(const Duration(seconds: 10));
    if (accessExpires.isBefore(compareDate)) {
      return null;
    }
    return LocalManager.instance.getString(StorageKeys.accessToken);
  }

  /// Navigates to the login screen on unauthenticated cases.
  static Future<void> _navigateToLogin() async {
    // TODO: Fix
    // LoginViewModel.kickedOut = true;
    await LocalManager.instance.clearAll();
    await NavigationManager.instance
        .navigateToPageClear(path: NavigationConstants.login);
  }

  Future<void> _storeToken(String token) async {
    await LocalManager.instance.setString(StorageKeys.accessToken, token);
    await LocalManager.instance.setInt(StorageKeys.accessTokenExpires,
        DateTime.now().add(Durations.accessExpires).millisecondsSinceEpoch);
  }
}
