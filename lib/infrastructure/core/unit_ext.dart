import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/infrastructure/core/enum_converter.dart';

const _enumMap = {
  'litres': Unit.litres,
  'ml': Unit.millilitres,
  'kilograms': Unit.kilograms,
  'kilogram': Unit.kilograms,
  'grams': Unit.grams,
  'celsius': Unit.celsius,
  'total': Unit.total,
};

extension UnitExt on Unit {
  String getValue() => EnumConverter(_enumMap).enumToString(this);

  static Unit fromValue(String value) =>
      EnumConverter(_enumMap).stringToEnum(value);
}
