import 'package:beer_app/domain/beers/models/beer_ingredients_hop.dart';
import 'package:beer_app/domain/beers/models/beer_ingredients_malt.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ingredients_yeast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_ingredients.freezed.dart';

@freezed
class BeerIngredients with _$BeerIngredients {
  factory BeerIngredients({
    required List<BeerIngredientsMalt> malt,
    required List<BeerIngredientsHop> hops,
    required BeerIngredientsYeast? yeast,
  }) = _BeerIngredients;
}
