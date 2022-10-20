import 'package:beer_app/presentation/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'DisplaySize',
    () {
      group(
        'isSmall',
        () {
          test(
            'should return true when maxWidth is 799',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 1000,
                maxWidth: 799,
                minHeight: 1000,
                maxHeight: 1000,
              );
              // act
              final result = DisplaySize.isSmall(constraints);

              // assert
              expect(result, isTrue);
            },
          );

          test(
            'should return false when maxWidth is 800',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 100,
                maxWidth: 800,
                minHeight: 100,
                maxHeight: 100,
              );
              // act
              final result = DisplaySize.isSmall(constraints);

              // assert
              expect(result, isFalse);
            },
          );
        },
      );

      group(
        'isMedium',
        () {
          test(
            'should return false when maxWidth is 799',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 1000,
                maxWidth: 799,
                minHeight: 1000,
                maxHeight: 1000,
              );
              // act
              final result = DisplaySize.isMedium(constraints);

              // assert
              expect(result, isFalse);
            },
          );

          test(
            'should return true when maxWidth is 800',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 100,
                maxWidth: 800,
                minHeight: 100,
                maxHeight: 100,
              );
              // act
              final result = DisplaySize.isMedium(constraints);

              // assert
              expect(result, isTrue);
            },
          );

          test(
            'should return true when maxWidth is 1199',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 100,
                maxWidth: 1199,
                minHeight: 100,
                maxHeight: 100,
              );
              // act
              final result = DisplaySize.isMedium(constraints);

              // assert
              expect(result, isTrue);
            },
          );

          test(
            'should return false when maxWidth is 1200',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 100,
                maxWidth: 1200,
                minHeight: 100,
                maxHeight: 100,
              );
              // act
              final result = DisplaySize.isMedium(constraints);

              // assert
              expect(result, isFalse);
            },
          );
        },
      );

      group(
        'isLarge',
        () {
          test(
            'should return false when maxWidth is 1199',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 1000,
                maxWidth: 1199,
                minHeight: 1000,
                maxHeight: 1000,
              );
              // act
              final result = DisplaySize.isLarge(constraints);

              // assert
              expect(result, isFalse);
            },
          );

          test(
            'should return true when maxWidth is 1200',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 1000,
                maxWidth: 1200,
                minHeight: 1000,
                maxHeight: 1000,
              );
              // act
              final result = DisplaySize.isLarge(constraints);

              // assert
              expect(result, isTrue);
            },
          );

          test(
            'should return true when maxWidth is 10000',
            () {
              // arrange
              const constraints = BoxConstraints(
                minWidth: 1000,
                maxWidth: 10000,
                minHeight: 1000,
                maxHeight: 1000,
              );
              // act
              final result = DisplaySize.isLarge(constraints);

              // assert
              expect(result, isTrue);
            },
          );
        },
      );
    },
  );
}
