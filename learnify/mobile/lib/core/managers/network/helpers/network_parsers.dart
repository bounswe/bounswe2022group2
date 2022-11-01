import 'package:dio/dio.dart';

import '../../../base/model/base_model.dart';

/// Parsers for the network operations.
mixin NetworkParsers {
  /// Parses the response according to the given model.
  static R? responseParser<R>(
    BaseModel<R> model,
    Response<dynamic> response, {
    DateTime? storedDate,
  }) {
    if (response.data == null) return null;
    if (response.data is R) return response.data;
    return response.data is Map<String, dynamic>
        ? model.fromJson(response.data!)
        : null;
  }
}
