import 'package:beer_app/domain/core/value_object.dart';
import 'package:flutter_test/flutter_test.dart';

class TestValueObject<T> extends ValueObject<T> {
  const TestValueObject(super.value);
}

void main() {
  group(
    'ValueObject',
    () {
      group(
        'operator ==',
        () {
          test(
            'should return true when value objects values are the same',
            () {
              // arrange
              const value = 'Testable value';
              const valueObject1 = TestValueObject(value);
              const valueObject2 = TestValueObject(value);

              // act
              final result = valueObject1 == valueObject2;

              // assert
              expect(result, isTrue);
            },
          );
        },
      );

      group(
        'hashCode',
        () {
          test(
            'should return value hashCode',
            () {
              // arrange
              const value = 'Testable value';
              const valueObject = TestValueObject(value);

              // act
              final result = valueObject.hashCode;

              // assert
              expect(result, value.hashCode);
            },
          );
        },
      );

      group(
        'toString',
        () {
          test(
            'should return correct string with value',
            () {
              // arrange
              const value = 'Testable value';
              const valueObject = TestValueObject(value);

              // act
              final result = valueObject.toString();

              // assert
              expect(result, 'ValueObject(${valueObject.value})');
            },
          );
        },
      );
    },
  );
}
