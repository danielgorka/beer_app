import 'package:beer_app/domain/beers/models/beer_ingredients_malt.dart';
import 'package:beer_app/domain/beers/value_objects/beer_malt_amount.dart';
import 'package:beer_app/domain/beers/value_objects/beer_malt_name.dart';
import 'package:beer_app/infrastructure/core/unit_ext.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_ingredients_malt_dto.freezed.dart';
part 'beer_ingredients_malt_dto.g.dart';

@freezed
class BeerIngredientsMaltDto with _$BeerIngredientsMaltDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeerIngredientsMaltDto({
    required String name,
    required UnitValueDto amount,
  }) = _BeerIngredientsMaltDto;

  const BeerIngredientsMaltDto._();

  factory BeerIngredientsMaltDto.fromDomain(
    BeerIngredientsMalt beerIngredientsMalt,
  ) {
    return BeerIngredientsMaltDto(
      name: beerIngredientsMalt.name.value,
      amount: UnitValueDto.fromDomain(beerIngredientsMalt.amount),
    );
  }

  factory BeerIngredientsMaltDto.fromJson(Map<String, dynamic> json) =>
      _$BeerIngredientsMaltDtoFromJson(json);

  BeerIngredientsMalt toDomain() {
    return BeerIngredientsMalt(
      name: BeerMaltName(name),
      amount: BeerMaltAmount(amount.value, UnitExt.fromValue(amount.unit)),
    );
  }
}
