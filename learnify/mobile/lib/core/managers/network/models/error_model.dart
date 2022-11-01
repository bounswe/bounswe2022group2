import 'package:dio/dio.dart';

import 'l_error_model.dart';

/// Customized error model.
class ErrorModel implements IErrorModel {
  /// Default constructor.
  ErrorModel({
    DioError? dioError,
    String? customErrorMessage,
    bool isAuthentication = false,
  })  : _dioError = dioError,
        _customMessage = customErrorMessage,
        _isAuthentication = isAuthentication;

  final DioError? _dioError;
  final String? _customMessage;
  final bool _isAuthentication;

  @override
  String get errorMessage =>
      _customMessage ??
      _dioError?.response?.data ??
      _dioError?.error ??
      'Undetermined Error Message';

  @override
  int get statusCode {
    if (_dioError?.response?.statusCode is int) {
      return _dioError!.response!.statusCode!;
    }
    return 500;
  }

  @override
  bool get isAuthenticationError => _isAuthentication;
}
