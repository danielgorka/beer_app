import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/infrastructure/core/enum_converter.dart';

const _enumMap = {
  Unit.litres: 'litres',
  Unit.kilograms: 'kilograms',
  Unit.grams: 'grams',
  Unit.celsius: 'celsius',
};

extension UnitExt on Unit {
  String getValue() => EnumConverter(_enumMap).enumToString(this);

  static Unit fromValue(String value) =>
      EnumConverter(_enumMap).stringToEnum(value);
}
