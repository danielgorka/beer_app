import 'package:beer_app/domain/beers/models/beer_ingredients_hop.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_add.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_amount.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_attribute.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_name.dart';
import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_hop_attribute_ext.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_hop_dto.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';

const beerHopName = BeerHopName('Cascade');
const beerHopAmount = BeerHopAmount(25, Unit.grams);
const beerHopAdd = BeerHopAdd('start');
const beerHopAttribute = BeerHopAttribute.bitter;

// Model
final beerIngredientsHop = BeerIngredientsHop(
  name: beerHopName,
  amount: beerHopAmount,
  add: beerHopAdd,
  attribute: beerHopAttribute,
);

// DTO
final beerIngredientsHopDto = BeerIngredientsHopDto(
  name: beerHopName.value,
  amount: UnitValueDto.fromDomain(beerHopAmount),
  add: beerHopAdd.value,
  attribute: beerHopAttribute.getValue(),
);

// JSON
final beerIngredientsHopJson = {
  'name': beerHopName.value,
  'amount': {
    'value': 25,
    'unit': 'grams',
  },
  'add': beerHopAdd.value,
  'attribute': beerHopAttribute.getValue(),
};
