import 'l_error_model.dart';

/// Abstract response model to define base properties.
abstract class IResponseModel<T> {
  /// Response data itself.
  T? data;

  /// Error of the response.
  IErrorModel? error;

  /// Returns whether the response has error.
  bool get hasError;
}
