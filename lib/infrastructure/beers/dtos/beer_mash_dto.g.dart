// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_mash_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeerMashDto _$$_BeerMashDtoFromJson(Map<String, dynamic> json) =>
    _$_BeerMashDto(
      temp: UnitValueDto.fromJson(json['temp'] as Map<String, dynamic>),
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$$_BeerMashDtoToJson(_$_BeerMashDto instance) =>
    <String, dynamic>{
      'temp': instance.temp.toJson(),
      'duration': instance.duration,
    };
