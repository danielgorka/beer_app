import 'package:freezed_annotation/freezed_annotation.dart';

class FirstBrewedConverter implements JsonConverter<DateTime, String> {
  const FirstBrewedConverter();

  @override
  DateTime fromJson(String json) {
    final parts = json.split('/');
    return DateTime(int.parse(parts[1]), int.parse(parts[0]));
  }

  @override
  String toJson(DateTime object) =>
      '${object.month.toString().padLeft(2, '0')}/${object.year}';
}
