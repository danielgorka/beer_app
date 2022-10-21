import 'package:beer_app/domain/beers/models/beer_mash.dart';
import 'package:beer_app/domain/beers/value_objects/beer_mash_duration.dart';
import 'package:beer_app/domain/beers/value_objects/beer_mash_temp.dart';
import 'package:beer_app/infrastructure/core/unit_ext.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_mash_dto.freezed.dart';
part 'beer_mash_dto.g.dart';

@freezed
class BeerMashDto with _$BeerMashDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeerMashDto({
    required UnitValueDto temp,
    required int? duration,
  }) = _BeerMashDto;

  const BeerMashDto._();

  factory BeerMashDto.fromDomain(BeerMash beerMash) {
    return BeerMashDto(
      temp: UnitValueDto.fromDomain(beerMash.temp),
      duration: beerMash.duration?.value,
    );
  }

  factory BeerMashDto.fromJson(Map<String, dynamic> json) =>
      _$BeerMashDtoFromJson(json);

  BeerMash toDomain() {
    return BeerMash(
      temp: BeerMashTemp(temp.value, UnitExt.fromValue(temp.unit)),
      duration: duration != null ? BeerMashDuration(duration!) : null,
    );
  }
}
