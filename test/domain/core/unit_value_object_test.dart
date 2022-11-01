import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/domain/core/unit_value_object.dart';
import 'package:flutter_test/flutter_test.dart';

class TestUnitValueObject extends UnitValueObject {
  const TestUnitValueObject(super.value, super.unit);
}

void main() {
  group(
    'UnitValueObject',
    () {
      group(
        'valueString',
        () {
          test(
            'should return value with unit',
            () {
              // arrange
              const unitValueObject = TestUnitValueObject(1.5, Unit.litres);

              // act
              final result = unitValueObject.valueString;

              // assert
              expect(result, '1.5 l');
            },
          );
        },
      );

      group(
        'operator ==',
        () {
          test(
            'should return true when value objects values '
            'and units are the same',
            () {
              // arrange
              const value = 10.5;
              const unit = Unit.celsius;
              const unitValueObject1 = TestUnitValueObject(value, unit);
              const unitValueObject2 = TestUnitValueObject(value, unit);

              // act
              final result = unitValueObject1 == unitValueObject2;

              // assert
              expect(result, isTrue);
            },
          );

          test(
            'should return false when value objects values '
            'are the same but units are different',
            () {
              // arrange
              const value = 10.5;
              const unitValueObject1 = TestUnitValueObject(value, Unit.celsius);
              const unitValueObject2 = TestUnitValueObject(value, Unit.grams);

              // act
              final result = unitValueObject1 == unitValueObject2;

              // assert
              expect(result, isFalse);
            },
          );
        },
      );

      group(
        'hashCode',
        () {
          test(
            'should return hashCode created with value and unit',
            () {
              // arrange
              const value = 10.5;
              const unit = Unit.celsius;
              const unitValueObject = TestUnitValueObject(value, unit);

              // act
              final result = unitValueObject.hashCode;

              // assert
              expect(result, value.hashCode ^ unit.hashCode);
            },
          );
        },
      );

      group(
        'toString',
        () {
          test(
            'should return correct string with value and unit name',
            () {
              // arrange
              const value = 11.3;
              const unit = Unit.kilograms;
              const unitValueObject = TestUnitValueObject(value, unit);

              // act
              final result = unitValueObject.toString();

              // assert
              expect(result, 'UnitValueObject(11.3 kg)');
            },
          );
        },
      );
    },
  );
}
