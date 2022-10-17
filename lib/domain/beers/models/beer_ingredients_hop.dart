import 'package:beer_app/domain/beers/value_objects/beer_hop_add.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_amount.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_attribute.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_ingredients_hop.freezed.dart';

@freezed
class BeerIngredientsHop with _$BeerIngredientsHop {
  factory BeerIngredientsHop({
    required BeerHopName name,
    required BeerHopAmount amount,
    required BeerHopAdd add,
    required BeerHopAttribute attribute,
  }) = _BeerIngredientsHop;
}
