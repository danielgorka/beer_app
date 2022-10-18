// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_ingredients_malt_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeerIngredientsMaltDto _$$_BeerIngredientsMaltDtoFromJson(
        Map<String, dynamic> json) =>
    _$_BeerIngredientsMaltDto(
      name: json['name'] as String,
      amount: UnitValueDto.fromJson(json['amount'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BeerIngredientsMaltDtoToJson(
        _$_BeerIngredientsMaltDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount.toJson(),
    };
