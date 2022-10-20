import 'package:beer_app/core/either_ext.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'EitherExt',
    () {
      const value = 'Value';
      group(
        'right',
        () {
          test(
            'should return right value when Either is right',
            () {
              // arrange
              const either = Right<String, String>(value);

              // act
              final result = either.right;

              // assert
              expect(result, value);
            },
          );

          test(
            'should throw StateError when Either is left',
            () {
              // arrange
              const either = Left<String, String>(value);

              // act
              String call() => either.right;

              // assert
              expect(call, throwsA(isA<StateError>()));
            },
          );
        },
      );

      group(
        'left',
        () {
          test(
            'should return left value when Either is left',
            () {
              // arrange
              const either = Left<String, String>(value);

              // act
              final result = either.left;

              // assert
              expect(result, value);
            },
          );

          test(
            'should throw StateError when Either is right',
            () {
              // arrange
              const either = Right<String, String>(value);

              // act
              String call() => either.left;

              // assert
              expect(call, throwsA(isA<StateError>()));
            },
          );
        },
      );
    },
  );
}
