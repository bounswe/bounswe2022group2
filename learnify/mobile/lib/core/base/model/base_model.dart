import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';

/// Base model for all of the models in the app.
abstract class BaseModel<T> extends Equatable {
  /// Base model.
  const BaseModel();

  /// Converts a model to a json.
  Map<String, dynamic> get toJson;

  /// Parses and converts a map/json to the given model.
  T fromJson(Map<String, dynamic> json);

  /// Returns the storage time of the model.
  DateTime? get storeDate => DateTime.now();

  /// Gets a field by its type.
  static R? getByType<R>(dynamic data) {
    if (R == DateTime) {
      if (data is! String) return null;
      return DateTime.tryParse(data) as R?;
    } else if (R == Duration) {
      if (data is int) return Duration(milliseconds: data) as R;
      final int? parsedData = int.tryParse(data);
      return parsedData == null
          ? null
          : Duration(milliseconds: parsedData) as R;
    } else if (R == double) {
      if (data is R?) return data;
      if (data is num) return data.toDouble() as R;
      if (data is String?) return double.tryParse(data ?? '') as R?;
    } else if (R == int) {
      if (data is R?) return data;
      if (data is num) return data.toInt() as R;
      if (data is String?) return int.tryParse(data ?? '') as R?;
    }
    return data is R ? data : (R == String ? data.toString() as R : null);
  }

  /// Gets a field by its type, difference from [getByType] is this will assign
  /// a default value to the field if it doesn't exist.
  static R getWithDefault<R>(dynamic data, R defaultValue) {
    final R? byTypeData = getByType<R>(data);
    return byTypeData is R ? byTypeData : defaultValue;
  }

  /// Gets a field by its type, difference from [getByType] is this will assign
  /// a default value to the field if it doesn't exist.
  static List<R> getList<R>(dynamic dynamicData) {
    final List<dynamic> data = dynamicData as List<dynamic>;
    if (data is List<R>) {
      return data;
    } else if (R == String) {
      return data.map((dynamic e) => e.toString()).toList() as List<R>;
    } else if (R == int) {
      // ignore: unnecessary_lambdas
      return data.map((dynamic e) => int.tryParse(e)).toList() as List<R>;
    } else if (R == double) {
      // ignore: unnecessary_lambdas
      return data.map((dynamic e) => double.tryParse(e)).toList() as List<R>;
    }
    return <R>[];
  }

  /// Gets a field by its type, difference from [getByType] is this will assign
  /// a default value to the field if it doesn't exist.
  /// Difference from [getWithDefault] is it works for nested maps.F
  static R getNestedMap<R>(Map<String, dynamic> data, R defaultValue,
      String firstKey, String secondKey) {
    final Map<String, dynamic> convertedMap =
        data[firstKey] is Map<String, dynamic>
            ? data[firstKey] as Map<String, dynamic>
            : <String, dynamic>{secondKey: defaultValue};
    return getWithDefault<R>(convertedMap[secondKey], defaultValue);
  }

  /// Converts a primitive type into a string.
  static String? primitiveToJson<R>(R? data) {
    if (data == null) return null;
    if (R == DateTime) {
      return (data as DateTime).toIso8601String();
    } else if (R == Duration) {
      return (data as Duration).inMilliseconds.toString();
    }
    return data.toString();
  }

  /// Returns list of given object by taking from the embedded map and parsing.
  static List<R> embeddedListFromJson<R extends BaseModel<R>>(
      dynamic json, R model) {
    if (json is List<Map<String, dynamic>>) {
      return List<R>.from(
          json.map((Map<String, dynamic> e) => model.fromJson(e)));
    } else if (json is List<dynamic>) {
      final List<R> modelList = <R>[];
      for (int i = 0; i < json.length; i++) {
        try {
          final Map<String, dynamic> convertedMap =
              jsonDecode(jsonEncode(json[i]));
          modelList.add(model.fromJson(convertedMap));
        } on Exception catch (err) {
          log(err.toString());
        }
      }
      return modelList;
    }
    return <R>[];
  }

  /// Converts a list of object to a list of json/map.
  static List<Map<String, dynamic>>? embeddedListToJson<R extends BaseModel<R>>(
      List<R>? list) {
    if (list is List<R>) {
      return List<Map<String, dynamic>>.from(
          list.map((R model) => model.toJson));
    }
    return <Map<String, dynamic>>[];
  }

  /// Parses and converts a json to the given model.
  static R embeddedModelFromJson<R extends BaseModel<R>>(
          dynamic json, R model) =>
      json is Map<String, dynamic> ? model.fromJson(json) : model;

  /// Parses and converts a model to a json/map.
  static Map<String, dynamic>? embeddedModelToJson<R extends BaseModel<R>>(
          R? model) =>
      model is R ? model.toJson : null;
}
