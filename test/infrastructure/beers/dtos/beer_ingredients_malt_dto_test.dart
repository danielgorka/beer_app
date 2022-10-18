import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_malt_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mock_values/beer_ingredient_malt.dart';

void main() {
  group(
    'BeerIngredientsMaltDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct BeerIngredientsMaltDto',
            () {
              // act
              final result =
                  BeerIngredientsMaltDto.fromDomain(beerIngredientsMalt);

              // assert
              expect(result, beerIngredientsMaltDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct BeerIngredientsMaltDto',
            () {
              // act
              final result =
                  BeerIngredientsMaltDto.fromJson(beerIngredientsMaltJson);

              // assert
              expect(result, beerIngredientsMaltDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct BeerIngredientsMalt',
            () {
              // act
              final result = beerIngredientsMaltDto.toDomain();

              // assert
              expect(result, beerIngredientsMalt);
            },
          );
        },
      );
    },
  );
}
