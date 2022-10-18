import 'package:beer_app/infrastructure/beers/dtos/beer_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mock_values/beer.dart';

void main() {
  group(
    'BeerDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct BeerDto',
            () {
              // act
              final result = BeerDto.fromDomain(beer);

              // assert
              expect(result, beerDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct BeerDto',
            () {
              // act
              final result = BeerDto.fromJson(beerJson);

              // assert
              expect(result, beerDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct Beer',
            () {
              // act
              final result = beerDto.toDomain();

              // assert
              expect(result, beer);
            },
          );
        },
      );
    },
  );
}
