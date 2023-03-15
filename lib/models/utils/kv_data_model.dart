// KV Stands for Key Value
class KV<T> {
  final String key;
  final T value;

  KV._(this.key, this.value);

  factory KV.of(String key, T value) {
    return KV._(key, value);
  }

  @override
  String toString() {
    return 'KV{_key: $key, _value: $value}';
  }
}
