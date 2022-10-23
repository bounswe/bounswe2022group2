/// Abstract error model to define base properties.
abstract class IErrorModel {
  /// Error messages includes the details of the error.
  String get errorMessage;

  /// Status code of the error.
  int get statusCode;

  /// Returns whether the error is an authentication error.
  bool get isAuthenticationError;
}
