import '../../../product/constants/storage_keys.dart';
import '../../base/model/base_model.dart';

abstract class ILocalManager {
  Future<void> initPreferences();

  int? getInt(StorageKeys key);
  Future<bool> setInt(StorageKeys key, int value);

  String? getString(StorageKeys key);
  Future<void> setString(StorageKeys key, String value);

  bool? getBool(StorageKeys key);
  Future<void> setBool(StorageKeys key, bool value);

  Future<T> getModel<T>(BaseModel<T> T, StorageKeys key);
  Future<void> setModel<T>(BaseModel<T> sampleModel, StorageKeys key);

  Future<List<T>> getList<T>(BaseModel<T> sampleModel, StorageKeys key);
  Future<void> setList<T>(List<BaseModel<T>> modelList, StorageKeys key);

  Future<void> clearAll();
}
