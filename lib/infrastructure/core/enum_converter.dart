/// Allows converting enum to string using values from [map].
class EnumConverter<T extends Enum> {
  EnumConverter(this.map);

  final Map<T, String> map;

  T stringToEnum(String value) {
    return map.entries.firstWhere((entry) => entry.value == value).key;
  }

  String enumToString(T value) {
    final result = map[value];
    if (result == null) {
      throw StateError('Unknown enum value: $value');
    }
    return result;
  }
}
