import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_hop_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mock_values/beer_ingredient_hop.dart';

void main() {
  group(
    'BeerIngredientsHopDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct BeerIngredientsHopDto',
            () {
              // act
              final result =
                  BeerIngredientsHopDto.fromDomain(beerIngredientsHop);

              // assert
              expect(result, beerIngredientsHopDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct BeerIngredientsHopDto',
            () {
              // act
              final result =
                  BeerIngredientsHopDto.fromJson(beerIngredientsHopJson);

              // assert
              expect(result, beerIngredientsHopDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct BeerIngredientsHop',
            () {
              // act
              final result = beerIngredientsHopDto.toDomain();

              // assert
              expect(result, beerIngredientsHop);
            },
          );
        },
      );
    },
  );
}
