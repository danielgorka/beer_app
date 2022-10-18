// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_ingredients_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeerIngredientsDto _$$_BeerIngredientsDtoFromJson(
        Map<String, dynamic> json) =>
    _$_BeerIngredientsDto(
      malt: (json['malt'] as List<dynamic>)
          .map(
              (e) => BeerIngredientsMaltDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      hops: (json['hops'] as List<dynamic>)
          .map((e) => BeerIngredientsHopDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      yeast: json['yeast'] as String,
    );

Map<String, dynamic> _$$_BeerIngredientsDtoToJson(
        _$_BeerIngredientsDto instance) =>
    <String, dynamic>{
      'malt': instance.malt.map((e) => e.toJson()).toList(),
      'hops': instance.hops.map((e) => e.toJson()).toList(),
      'yeast': instance.yeast,
    };
