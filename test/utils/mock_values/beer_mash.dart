import 'package:beer_app/domain/beers/models/beer_mash.dart';
import 'package:beer_app/domain/beers/value_objects/beer_mash_duration.dart';
import 'package:beer_app/domain/beers/value_objects/beer_mash_temp.dart';
import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_mash_dto.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';

const beerMashTemp = BeerMashTemp(65, Unit.celsius);
const beerMashDuration = BeerMashDuration(75);

// Model
final beerMash = BeerMash(
  temp: beerMashTemp,
  duration: beerMashDuration,
);

// DTO
final beerMashDto = BeerMashDto(
  temp: UnitValueDto.fromDomain(beerMashTemp),
  duration: beerMashDuration.value,
);

// JSON
final beerMashJson = {
  'temp': {
    'value': 65.0,
    'unit': 'celsius',
  },
  'duration': beerMashDuration.value,
};
