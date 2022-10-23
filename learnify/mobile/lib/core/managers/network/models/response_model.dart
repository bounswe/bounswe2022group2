import '_response_model.dart';
import 'l_error_model.dart';

/// Creates a response model by implementing the base.
class ResponseModel<T> implements IResponseModel<T> {
  /// Default constructor.
  const ResponseModel({this.data, this.error});

  @override
  final T? data;
  @override
  final IErrorModel? error;

  @override
  set data(T? incomingData) => data = incomingData;

  @override
  set error(IErrorModel? incomingError) => error = incomingError;

  @override
  bool get hasError => error != null || data == null;
}
