import 'package:beer_app/domain/beers/value_objects/beer_malt_amount.dart';
import 'package:beer_app/domain/beers/value_objects/beer_malt_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_ingredients_malt.freezed.dart';

@freezed
class BeerIngredientsMalt with _$BeerIngredientsMalt {
  factory BeerIngredientsMalt({
    required BeerMaltName name,
    required BeerMaltAmount amount,
  }) = _BeerIngredientsMalt;
}
