/// Allows converting enum to string using values from [map].
class EnumConverter<T extends Enum> {
  EnumConverter(this.map);

  final Map<String, T> map;

  T stringToEnum(String value) {
    // Workaround for typos in API
    final val = value.toLowerCase().trim();
    final result = map[val];
    if (result == null) {
      throw StateError('Unknown enum value: $value');
    }
    return result;
  }

  String enumToString(T value) {
    return map.entries.firstWhere((entry) => entry.value == value).key;
  }
}
