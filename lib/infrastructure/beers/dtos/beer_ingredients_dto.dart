import 'package:beer_app/domain/beers/models/beer_ingredients.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ingredients_yeast.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_hop_dto.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_malt_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_ingredients_dto.freezed.dart';
part 'beer_ingredients_dto.g.dart';

@freezed
class BeerIngredientsDto with _$BeerIngredientsDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeerIngredientsDto({
    required List<BeerIngredientsMaltDto> malt,
    required List<BeerIngredientsHopDto> hops,
    required String? yeast,
  }) = _BeerIngredientsDto;

  const BeerIngredientsDto._();

  factory BeerIngredientsDto.fromDomain(BeerIngredients beerIngredients) {
    return BeerIngredientsDto(
      malt:
          beerIngredients.malt.map(BeerIngredientsMaltDto.fromDomain).toList(),
      hops: beerIngredients.hops.map(BeerIngredientsHopDto.fromDomain).toList(),
      yeast: beerIngredients.yeast?.value,
    );
  }

  factory BeerIngredientsDto.fromJson(Map<String, dynamic> json) =>
      _$BeerIngredientsDtoFromJson(json);

  BeerIngredients toDomain() {
    return BeerIngredients(
      malt: malt.map((e) => e.toDomain()).toList(),
      hops: hops.map((e) => e.toDomain()).toList(),
      yeast: yeast != null ? BeerIngredientsYeast(yeast!) : null,
    );
  }
}
