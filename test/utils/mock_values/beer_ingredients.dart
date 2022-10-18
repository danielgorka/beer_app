import 'package:beer_app/domain/beers/models/beer_ingredients.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ingredients_yeast.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_dto.dart';

import 'beer_ingredient_hop.dart';
import 'beer_ingredient_malt.dart';

const beerIngredientsYeast =
    BeerIngredientsYeast('Wyeast 1056 - American Ale™');
// Model
final beerIngredients = BeerIngredients(
  malt: [beerIngredientsMalt],
  hops: [beerIngredientsHop],
  yeast: beerIngredientsYeast,
);

// DTO
final beerIngredientsDto = BeerIngredientsDto(
  malt: [beerIngredientsMaltDto],
  hops: [beerIngredientsHopDto],
  yeast: beerIngredientsYeast.value,
);

// JSON
final beerIngredientsJson = {
  'malt': [beerIngredientsMaltJson],
  'hops': [beerIngredientsHopJson],
  'yeast': beerIngredientsYeast.value,
};
