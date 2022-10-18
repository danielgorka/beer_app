import 'package:beer_app/domain/beers/models/beer_method.dart';
import 'package:beer_app/domain/beers/value_objects/beer_twist.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_fermentation_dto.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_mash_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_method_dto.freezed.dart';
part 'beer_method_dto.g.dart';

@freezed
class BeerMethodDto with _$BeerMethodDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeerMethodDto({
    required List<BeerMashDto> mashTemp,
    required BeerFermentationDto fermentation,
    required String? twist,
  }) = _BeerMethodDto;

  const BeerMethodDto._();

  factory BeerMethodDto.fromDomain(BeerMethod beerMethod) {
    return BeerMethodDto(
      mashTemp: beerMethod.mashTemp.map(BeerMashDto.fromDomain).toList(),
      fermentation: BeerFermentationDto.fromDomain(beerMethod.fermentation),
      twist: beerMethod.twist?.value,
    );
  }

  factory BeerMethodDto.fromJson(Map<String, dynamic> json) =>
      _$BeerMethodDtoFromJson(json);

  BeerMethod toDomain() {
    return BeerMethod(
      mashTemp: mashTemp.map((e) => e.toDomain()).toList(),
      fermentation: fermentation.toDomain(),
      twist: twist != null ? BeerTwist(twist!) : null,
    );
  }
}
