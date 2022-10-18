import 'package:beer_app/infrastructure/beers/dtos/beer_fermentation_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mock_values/beer_fermentation.dart';

void main() {
  group(
    'BeerFermentationDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct BeerFermentationDto',
            () {
              // act
              final result = BeerFermentationDto.fromDomain(beerFermentation);

              // assert
              expect(result, beerFermentationDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct BeerFermentationDto',
            () {
              // act
              final result = BeerFermentationDto.fromJson(beerFermentationJson);

              // assert
              expect(result, beerFermentationDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct BeerFermentation',
            () {
              // act
              final result = beerFermentationDto.toDomain();

              // assert
              expect(result, beerFermentation);
            },
          );
        },
      );
    },
  );
}
