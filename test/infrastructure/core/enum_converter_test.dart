import 'package:beer_app/infrastructure/core/enum_converter.dart';
import 'package:flutter_test/flutter_test.dart';

enum TestEnum {
  value1,
  value2,
  value3,
}

void main() {
  group(
    'EnumConverter',
    () {
      const map = {
        'value1': TestEnum.value1,
        'value2': TestEnum.value2,
      };

      late EnumConverter enumConverter;

      setUp(() {
        enumConverter = EnumConverter(map);
      });

      group(
        'stringToEnum',
        () {
          test(
            'should return enum when string value exists in map',
            () {
              // arrange
              const value = ' Value2';

              // act
              final result = enumConverter.stringToEnum(value);

              // assert
              expect(result, TestEnum.value2);
            },
          );

          test(
            'should throw StateError '
            'when string value does no exist in map',
            () {
              // arrange
              const value = 'other';

              // act
              Enum call() => enumConverter.stringToEnum(value);

              // assert
              expect(call, throwsA(isA<StateError>()));
            },
          );
        },
      );

      group(
        'enumToString',
        () {
          test(
            'should return string when enum exists in map',
            () {
              // arrange
              const value = TestEnum.value2;

              // act
              final result = enumConverter.enumToString(value);

              // assert
              expect(result, 'value2');
            },
          );

          test(
            'should throw StateError when enum does no exist in map',
            () {
              // arrange
              const value = TestEnum.value3;

              // act
              String call() => enumConverter.enumToString(value);

              // assert
              expect(call, throwsA(isA<StateError>()));
            },
          );
        },
      );
    },
  );
}
