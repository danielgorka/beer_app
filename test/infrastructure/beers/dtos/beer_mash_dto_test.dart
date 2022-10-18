import 'package:beer_app/infrastructure/beers/dtos/beer_mash_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mock_values/beer_mash.dart';

void main() {
  group(
    'BeerMashDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct BeerMashDto',
            () {
              // act
              final result = BeerMashDto.fromDomain(beerMash);

              // assert
              expect(result, beerMashDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct BeerMashDto',
            () {
              // act
              final result = BeerMashDto.fromJson(beerMashJson);

              // assert
              expect(result, beerMashDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct BeerMash',
            () {
              // act
              final result = beerMashDto.toDomain();

              // assert
              expect(result, beerMash);
            },
          );
        },
      );
    },
  );
}
