// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeerDto _$$_BeerDtoFromJson(Map<String, dynamic> json) => _$_BeerDto(
      id: json['id'] as int,
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      firstBrewed: json['first_brewed'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String?,
      abv: (json['abv'] as num).toDouble(),
      ibu: (json['ibu'] as num?)?.toDouble(),
      targetFg: (json['target_fg'] as num?)?.toDouble(),
      targetOg: (json['target_og'] as num?)?.toDouble(),
      ebc: (json['ebc'] as num?)?.toDouble(),
      srm: (json['srm'] as num?)?.toDouble(),
      ph: (json['ph'] as num?)?.toDouble(),
      attenuationLevel: (json['attenuation_level'] as num?)?.toDouble(),
      volume: UnitValueDto.fromJson(json['volume'] as Map<String, dynamic>),
      boilVolume:
          UnitValueDto.fromJson(json['boil_volume'] as Map<String, dynamic>),
      method: BeerMethodDto.fromJson(json['method'] as Map<String, dynamic>),
      ingredients: BeerIngredientsDto.fromJson(
          json['ingredients'] as Map<String, dynamic>),
      foodPairing: (json['food_pairing'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      brewersTips: json['brewers_tips'] as String,
      contributedBy: json['contributed_by'] as String,
    );

Map<String, dynamic> _$$_BeerDtoToJson(_$_BeerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'tagline': instance.tagline,
      'first_brewed': instance.firstBrewed,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'abv': instance.abv,
      'ibu': instance.ibu,
      'target_fg': instance.targetFg,
      'target_og': instance.targetOg,
      'ebc': instance.ebc,
      'srm': instance.srm,
      'ph': instance.ph,
      'attenuation_level': instance.attenuationLevel,
      'volume': instance.volume.toJson(),
      'boil_volume': instance.boilVolume.toJson(),
      'method': instance.method.toJson(),
      'ingredients': instance.ingredients.toJson(),
      'food_pairing': instance.foodPairing,
      'brewers_tips': instance.brewersTips,
      'contributed_by': instance.contributedBy,
    };
