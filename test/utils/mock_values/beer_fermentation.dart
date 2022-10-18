import 'package:beer_app/domain/beers/models/beer_fermentation.dart';
import 'package:beer_app/domain/beers/value_objects/beer_fermentation_temp.dart';
import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_fermentation_dto.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';

const beerFermentationTemp = BeerFermentationTemp(19, Unit.celsius);

// Model
final beerFermentation = BeerFermentation(
  temp: beerFermentationTemp,
);

// DTO
final beerFermentationDto = BeerFermentationDto(
  temp: UnitValueDto.fromDomain(beerFermentationTemp),
);

// JSON
final beerFermentationJson = {
  'temp': {
    'value': 19,
    'unit': 'celsius',
  },
};
