import 'package:beer_app/domain/core/unit.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class UnitValueObject {
  const UnitValueObject(this.value, this.unit);

  final double? value;
  final Unit unit;

  String get valueString => '$value ${unit.name}';

  @override
  bool operator ==(Object other) {
    return other is UnitValueObject &&
        other.value == value &&
        other.unit == unit;
  }

  @override
  int get hashCode => value.hashCode ^ unit.hashCode;

  @override
  String toString() => 'UnitValueObject($value ${unit.name})';
}
