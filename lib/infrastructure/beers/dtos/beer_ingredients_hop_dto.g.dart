// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_ingredients_hop_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeerIngredientsHopDto _$$_BeerIngredientsHopDtoFromJson(
        Map<String, dynamic> json) =>
    _$_BeerIngredientsHopDto(
      name: json['name'] as String,
      amount: UnitValueDto.fromJson(json['amount'] as Map<String, dynamic>),
      add: json['add'] as String,
      attribute: json['attribute'] as String,
    );

Map<String, dynamic> _$$_BeerIngredientsHopDtoToJson(
        _$_BeerIngredientsHopDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount.toJson(),
      'add': instance.add,
      'attribute': instance.attribute,
    };
