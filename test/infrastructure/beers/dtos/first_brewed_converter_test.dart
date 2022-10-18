import 'package:beer_app/infrastructure/beers/dtos/first_brewed_converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'FirstBrewedConverter',
    () {
      group(
        'fromJson',
        () {
          test(
            'should return correct DateTime',
            () {
              // arrange
              const json = '02/2010';
              final dateTime = DateTime(2010, 2);

              // act
              final result = const FirstBrewedConverter().fromJson(json);

              // assert
              expect(result, dateTime);
            },
          );
        },
      );

      group(
        'toJson',
        () {
          test(
            'should return correct String',
            () {
              // arrange
              final dateTime = DateTime(2015, 3);
              const json = '03/2015';

              // act
              final result = const FirstBrewedConverter().toJson(dateTime);

              // assert
              expect(result, json);
            },
          );
        },
      );
    },
  );
}
