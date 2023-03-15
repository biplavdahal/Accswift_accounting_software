import 'package:accswift/models/utils/kv_data_model.dart';

abstract class SharedPreferenceService {
  // Callable to get the shared preference file.
  Future<void> call();

  /// Sets a value in the shared preference file.
  Future<KV<T>> set<T>(String key, T value);

  /// Gets a value from the shared preference file.
  Future<KV<T>> get<T>(String key);

  /// Remove a key value from the shared preference file.
  Future<void> remove(String key);
}
