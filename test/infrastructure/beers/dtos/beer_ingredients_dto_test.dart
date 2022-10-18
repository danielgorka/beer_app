import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mock_values/beer_ingredients.dart';

void main() {
  group(
    'BeerIngredientsDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct BeerIngredientsDto',
            () {
              // act
              final result = BeerIngredientsDto.fromDomain(beerIngredients);

              // assert
              expect(result, beerIngredientsDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct BeerIngredientsDto',
            () {
              // act
              final result = BeerIngredientsDto.fromJson(beerIngredientsJson);

              // assert
              expect(result, beerIngredientsDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct BeerIngredients',
            () {
              // act
              final result = beerIngredientsDto.toDomain();

              // assert
              expect(result, beerIngredients);
            },
          );
        },
      );
    },
  );
}
