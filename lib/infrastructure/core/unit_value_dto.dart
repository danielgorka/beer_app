import 'package:beer_app/domain/core/unit_value_object.dart';
import 'package:beer_app/infrastructure/core/unit_ext.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unit_value_dto.freezed.dart';
part 'unit_value_dto.g.dart';

@freezed
class UnitValueDto with _$UnitValueDto {
  const factory UnitValueDto({
    required double value,
    required String unit,
  }) = _UnitValueDto;

  const UnitValueDto._();

  factory UnitValueDto.fromDomain(UnitValueObject valueObject) {
    return UnitValueDto(
      value: valueObject.value,
      unit: valueObject.unit.getValue(),
    );
  }

  factory UnitValueDto.fromJson(Map<String, dynamic> json) =>
      _$UnitValueDtoFromJson(json);
}
