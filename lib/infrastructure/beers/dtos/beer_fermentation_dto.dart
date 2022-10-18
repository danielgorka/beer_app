import 'package:beer_app/domain/beers/models/beer_fermentation.dart';
import 'package:beer_app/domain/beers/value_objects/beer_fermentation_temp.dart';
import 'package:beer_app/infrastructure/core/unit_ext.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_fermentation_dto.freezed.dart';
part 'beer_fermentation_dto.g.dart';

@freezed
class BeerFermentationDto with _$BeerFermentationDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeerFermentationDto({
    required UnitValueDto temp,
  }) = _BeerFermentationDto;

  const BeerFermentationDto._();

  factory BeerFermentationDto.fromDomain(BeerFermentation beerFermentation) {
    return BeerFermentationDto(
      temp: UnitValueDto.fromDomain(beerFermentation.temp),
    );
  }

  factory BeerFermentationDto.fromJson(Map<String, dynamic> json) =>
      _$BeerFermentationDtoFromJson(json);

  BeerFermentation toDomain() {
    return BeerFermentation(
      temp: BeerFermentationTemp(temp.value, UnitExt.fromValue(temp.unit)),
    );
  }
}
