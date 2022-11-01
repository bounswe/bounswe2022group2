import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../product/constants/storage_keys.dart';
import '../../base/model/base_model.dart';
import 'l_local_manager.dart';

class LocalManager implements ILocalManager {
  factory LocalManager() => _instance;
  LocalManager._();
  static final LocalManager _instance = LocalManager._();
  static LocalManager get instance => _instance;

  static SharedPreferences? _prefs;

  @override
  Future<void> initPreferences() async =>
      _prefs ??= await SharedPreferences.getInstance();

  @override
  int? getInt(StorageKeys key) => _prefs?.getInt(key.toString());

  @override
  Future<bool> setInt(StorageKeys key, int value) async =>
      await _prefs?.setInt(key.toString(), value) ?? false;

  @override
  String? getString(StorageKeys key) => _prefs?.getString(key.toString());

  @override
  Future<bool> setString(StorageKeys key, String value) async =>
      await _prefs?.setString(key.toString(), value) ?? false;

  @override
  bool? getBool(StorageKeys key) => _prefs?.getBool(key.toString());

  @override
  Future<bool> setBool(StorageKeys key, bool value) async =>
      await _prefs?.setBool(key.toString(), value) ?? false;

  @override
  List<T> getList<T>(BaseModel<T> sampleModel, StorageKeys key) {
    final Map<String, dynamic> customMap =
        jsonDecode(_prefs?.getString(key.toString()) ?? '')
            as Map<String, dynamic>;
    return List<T>.from((customMap['list'] as List<Map<String, dynamic>>)
        .map((Map<String, dynamic> model) => sampleModel.fromJson(model)));
  }

  @override
  Future<void> setList<T>(List<BaseModel<T>> modelList, StorageKeys key) async {
    final String saveString = jsonEncode(modelList
            .map((BaseModel<T> model) => model.toJson)
            .toList() as List<T>)
        .toString();
    await _prefs?.setString(key.toString(), saveString);
  }

  @override
  T getModel<T>(BaseModel<T> model, StorageKeys key) {
    final Map<String, dynamic> customMap =
        jsonDecode(_prefs?.getString(key.toString()) ?? '{}') ??
            <String, dynamic>{};
    return model.fromJson(customMap);
  }

  @override
  Future<void> setModel<T>(BaseModel<T> model, StorageKeys key) async {
    final String saveString = jsonEncode(model.toJson);
    await _prefs?.setString(key.toString(), saveString);
  }

  @override
  Future<void> clearAll() async => await _prefs?.clear();
}
