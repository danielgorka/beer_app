import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_abv.dart';
import 'package:beer_app/domain/beers/value_objects/beer_attenuation_level.dart';
import 'package:beer_app/domain/beers/value_objects/beer_boil_volume.dart';
import 'package:beer_app/domain/beers/value_objects/beer_brewers_tips.dart';
import 'package:beer_app/domain/beers/value_objects/beer_contributed_by.dart';
import 'package:beer_app/domain/beers/value_objects/beer_description.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ebc.dart';
import 'package:beer_app/domain/beers/value_objects/beer_first_brewed.dart';
import 'package:beer_app/domain/beers/value_objects/beer_food.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ibu.dart';
import 'package:beer_app/domain/beers/value_objects/beer_id.dart';
import 'package:beer_app/domain/beers/value_objects/beer_image_url.dart';
import 'package:beer_app/domain/beers/value_objects/beer_name.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ph.dart';
import 'package:beer_app/domain/beers/value_objects/beer_srm.dart';
import 'package:beer_app/domain/beers/value_objects/beer_tagline.dart';
import 'package:beer_app/domain/beers/value_objects/beer_target_fg.dart';
import 'package:beer_app/domain/beers/value_objects/beer_target_og.dart';
import 'package:beer_app/domain/beers/value_objects/beer_volume.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_ingredients_dto.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_method_dto.dart';
import 'package:beer_app/infrastructure/core/unit_ext.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_dto.freezed.dart';
part 'beer_dto.g.dart';

@freezed
class BeerDto with _$BeerDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeerDto({
    required int id,
    required String name,
    required String tagline,
    required String firstBrewed,
    required String description,
    required String? imageUrl,
    required double abv,
    required double? ibu,
    required double? targetFg,
    required double? targetOg,
    required double? ebc,
    required double? srm,
    required double? ph,
    required double? attenuationLevel,
    required UnitValueDto volume,
    required UnitValueDto boilVolume,
    required BeerMethodDto method,
    required BeerIngredientsDto ingredients,
    required List<String> foodPairing,
    required String brewersTips,
    required String contributedBy,
  }) = _BeerDto;

  const BeerDto._();

  factory BeerDto.fromDomain(Beer beer) {
    return BeerDto(
      id: beer.id.value,
      name: beer.name.value,
      tagline: beer.tagline.value,
      firstBrewed: beer.firstBrewed.stringValue,
      description: beer.description.value,
      imageUrl: beer.imageUrl?.value,
      abv: beer.abv.value,
      ibu: beer.ibu?.value,
      targetFg: beer.targetFg?.value,
      targetOg: beer.targetOg?.value,
      ebc: beer.ebc?.value,
      srm: beer.srm?.value,
      ph: beer.ph?.value,
      attenuationLevel: beer.attenuationLevel?.value,
      volume: UnitValueDto.fromDomain(beer.volume),
      boilVolume: UnitValueDto.fromDomain(beer.boilVolume),
      method: BeerMethodDto.fromDomain(beer.method),
      ingredients: BeerIngredientsDto.fromDomain(beer.ingredients),
      foodPairing: beer.foodPairing.map((e) => e.value).toList(),
      brewersTips: beer.brewersTips.value,
      contributedBy: beer.contributedBy.value,
    );
  }

  factory BeerDto.fromJson(Map<String, dynamic> json) =>
      _$BeerDtoFromJson(json);

  Beer toDomain() {
    return Beer(
      id: BeerId(id),
      name: BeerName(name),
      tagline: BeerTagline(tagline),
      firstBrewed: BeerFirstBrewed.fromString(firstBrewed),
      description: BeerDescription(description),
      imageUrl: imageUrl != null ? BeerImageUrl(imageUrl!) : null,
      abv: BeerAbv(abv),
      ibu: ibu != null ? BeerIbu(ibu!) : null,
      targetFg: targetFg != null ? BeerTargetFg(targetFg!) : null,
      targetOg: targetOg != null ? BeerTargetOg(targetOg!) : null,
      ebc: ebc != null ? BeerEbc(ebc!) : null,
      srm: srm != null ? BeerSrm(srm!) : null,
      ph: ph != null ? BeerPh(ph!) : null,
      attenuationLevel: attenuationLevel != null
          ? BeerAttenuationLevel(attenuationLevel!)
          : null,
      volume: BeerVolume(volume.value, UnitExt.fromValue(volume.unit)),
      boilVolume: BeerBoilVolume(
        boilVolume.value,
        UnitExt.fromValue(boilVolume.unit),
      ),
      method: method.toDomain(),
      ingredients: ingredients.toDomain(),
      foodPairing: foodPairing.map(BeerFood.new).toList(),
      brewersTips: BeerBrewersTips(brewersTips),
      contributedBy: BeerContributedBy(contributedBy),
    );
  }
}
