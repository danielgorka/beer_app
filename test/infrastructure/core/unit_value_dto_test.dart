import 'package:beer_app/infrastructure/core/unit_ext.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/mock_values/beer.dart';

void main() {
  group(
    'UnitValueDto',
    () {
      group(
        'fromDomain',
        () {
          test(
            'should return correct UnitValueDto',
            () {
              // act
              final result = UnitValueDto.fromDomain(beerVolume);

              // assert
              expect(result.value, beerVolume.value);
              expect(result.unit, beerVolume.unit.getValue());
            },
          );
        },
      );

      group(
        'fromJson',
        () {
          test(
            'should return correct UnitValueDto',
            () {
              // arrange
              final json = {
                'value': beerVolume.value,
                'unit': beerVolume.unit.getValue(),
              };

              // act
              final result = UnitValueDto.fromJson(json);

              // assert
              expect(result.value, beerVolume.value);
              expect(result.unit, beerVolume.unit.getValue());
            },
          );
        },
      );
    },
  );
}
