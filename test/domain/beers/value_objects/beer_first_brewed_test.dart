import 'package:beer_app/domain/beers/value_objects/beer_first_brewed.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'BeerFirstBrewed',
    () {
      group(
        'fromString',
        () {
          test(
            'should return BeerFirstBrewed with year and month '
            'when string is in format MM/yyyy',
            () {
              // arrange
              const string = '02/2010';
              // act
              final result = BeerFirstBrewed.fromString(string);
              // assert
              expect(
                result,
                BeerFirstBrewed(DateTime(2010, 2), monthPrecision: true),
              );
            },
          );
          test(
            'should return BeerFirstBrewed with year only '
            'when string is in format yyyy',
            () {
              // arrange
              const string = '2013';
              // act
              final result = BeerFirstBrewed.fromString(string);
              // assert
              expect(
                result,
                BeerFirstBrewed(DateTime(2013), monthPrecision: false),
              );
            },
          );
        },
      );

      group(
        'stringValue',
        () {
          test(
            'should return string in format MM/yyyy '
            'when monthPrecision is true',
            () {
              // arrange
              final beerFirstBrewed = BeerFirstBrewed(
                DateTime(2010, 2),
                monthPrecision: true,
              );
              // act
              final result = beerFirstBrewed.stringValue;
              // assert
              expect(result, '02/2010');
            },
          );
          test(
            'should return string in format yyyy '
            'when monthPrecision is false',
            () {
              // arrange
              final beerFirstBrewed = BeerFirstBrewed(
                DateTime(2013),
                monthPrecision: false,
              );
              // act
              final result = beerFirstBrewed.stringValue;
              // assert
              expect(result, '2013');
            },
          );
        },
      );
    },
  );
}
