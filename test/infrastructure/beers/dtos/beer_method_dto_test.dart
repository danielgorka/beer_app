import 'package:beer_app/infrastructure/beers/dtos/beer_method_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/mock_values/beer_method.dart';

void main() {
  group(
    'BeerMethodDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct BeerMethodDto',
            () {
              // act
              final result = BeerMethodDto.fromDomain(beerMethod);

              // assert
              expect(result, beerMethodDto);
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct BeerMethodDto',
            () {
              // act
              final result = BeerMethodDto.fromJson(beerMethodJson);

              // assert
              expect(result, beerMethodDto);
            },
          );
        },
      );

      group(
        'toDomain',
        () {
          test(
            'should return correct BeerMethod',
            () {
              // act
              final result = beerMethodDto.toDomain();

              // assert
              expect(result, beerMethod);
            },
          );
        },
      );
    },
  );
}
