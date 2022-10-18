import 'package:beer_app/domain/beers/models/beer_ingredients_hop.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_amount.dart';
import 'package:beer_app/domain/beers/value_objects/beer_hop_name.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_hop_add_ext.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_hop_attribute_ext.dart';
import 'package:beer_app/infrastructure/core/unit_ext.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_ingredients_hop_dto.freezed.dart';
part 'beer_ingredients_hop_dto.g.dart';

@freezed
class BeerIngredientsHopDto with _$BeerIngredientsHopDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeerIngredientsHopDto({
    required String name,
    required UnitValueDto amount,
    required String add,
    required String attribute,
  }) = _BeerIngredientsHopDto;

  const BeerIngredientsHopDto._();

  factory BeerIngredientsHopDto.fromDomain(
    BeerIngredientsHop beerIngredientsHop,
  ) {
    return BeerIngredientsHopDto(
      name: beerIngredientsHop.name.value,
      amount: UnitValueDto.fromDomain(beerIngredientsHop.amount),
      add: beerIngredientsHop.add.getValue(),
      attribute: beerIngredientsHop.attribute.getValue(),
    );
  }

  factory BeerIngredientsHopDto.fromJson(Map<String, dynamic> json) =>
      _$BeerIngredientsHopDtoFromJson(json);

  BeerIngredientsHop toDomain() {
    return BeerIngredientsHop(
      name: BeerHopName(name),
      amount: BeerHopAmount(amount.value, UnitExt.fromValue(amount.unit)),
      add: BeerHopAddExt.fromValue(add),
      attribute: BeerHopAttributeExt.fromValue(attribute),
    );
  }
}
