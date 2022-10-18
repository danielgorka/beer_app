import 'package:beer_app/domain/beers/models/beer_ingredients_malt.dart';
import 'package:beer_app/domain/beers/value_objects/beer_malt_amount.dart';
import 'package:beer_app/domain/beers/value_objects/beer_malt_name.dart';
import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_malt_dto.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';

const beerMaltName = BeerMaltName('Extra Pale');
const beerMaltAmount = BeerMaltAmount(2.81, Unit.kilograms);

// Model
final beerIngredientsMalt = BeerIngredientsMalt(
  name: beerMaltName,
  amount: beerMaltAmount,
);

// DTO
final beerIngredientsMaltDto = BeerIngredientsMaltDto(
  name: beerMaltName.value,
  amount: UnitValueDto.fromDomain(beerMaltAmount),
);

// JSON
final beerIngredientsMaltJson = {
  'name': beerMaltName.value,
  'amount': {
    'value': 2.81,
    'unit': 'kilograms',
  },
};
