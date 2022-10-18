// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeerMethodDto _$$_BeerMethodDtoFromJson(Map<String, dynamic> json) =>
    _$_BeerMethodDto(
      mashTemp: (json['mash_temp'] as List<dynamic>)
          .map((e) => BeerMashDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      fermentation: BeerFermentationDto.fromJson(
          json['fermentation'] as Map<String, dynamic>),
      twist: json['twist'] as String?,
    );

Map<String, dynamic> _$$_BeerMethodDtoToJson(_$_BeerMethodDto instance) =>
    <String, dynamic>{
      'mash_temp': instance.mashTemp.map((e) => e.toJson()).toList(),
      'fermentation': instance.fermentation.toJson(),
      'twist': instance.twist,
    };
