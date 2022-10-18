// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unit_value_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnitValueDto _$UnitValueDtoFromJson(Map<String, dynamic> json) {
  return _UnitValueDto.fromJson(json);
}

/// @nodoc
mixin _$UnitValueDto {
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnitValueDtoCopyWith<UnitValueDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitValueDtoCopyWith<$Res> {
  factory $UnitValueDtoCopyWith(
          UnitValueDto value, $Res Function(UnitValueDto) then) =
      _$UnitValueDtoCopyWithImpl<$Res, UnitValueDto>;
  @useResult
  $Res call({double value, String unit});
}

/// @nodoc
class _$UnitValueDtoCopyWithImpl<$Res, $Val extends UnitValueDto>
    implements $UnitValueDtoCopyWith<$Res> {
  _$UnitValueDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnitValueDtoCopyWith<$Res>
    implements $UnitValueDtoCopyWith<$Res> {
  factory _$$_UnitValueDtoCopyWith(
          _$_UnitValueDto value, $Res Function(_$_UnitValueDto) then) =
      __$$_UnitValueDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double value, String unit});
}

/// @nodoc
class __$$_UnitValueDtoCopyWithImpl<$Res>
    extends _$UnitValueDtoCopyWithImpl<$Res, _$_UnitValueDto>
    implements _$$_UnitValueDtoCopyWith<$Res> {
  __$$_UnitValueDtoCopyWithImpl(
      _$_UnitValueDto _value, $Res Function(_$_UnitValueDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? unit = null,
  }) {
    return _then(_$_UnitValueDto(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnitValueDto extends _UnitValueDto {
  const _$_UnitValueDto({required this.value, required this.unit}) : super._();

  factory _$_UnitValueDto.fromJson(Map<String, dynamic> json) =>
      _$$_UnitValueDtoFromJson(json);

  @override
  final double value;
  @override
  final String unit;

  @override
  String toString() {
    return 'UnitValueDto(value: $value, unit: $unit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnitValueDto &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnitValueDtoCopyWith<_$_UnitValueDto> get copyWith =>
      __$$_UnitValueDtoCopyWithImpl<_$_UnitValueDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnitValueDtoToJson(
      this,
    );
  }
}

abstract class _UnitValueDto extends UnitValueDto {
  const factory _UnitValueDto(
      {required final double value,
      required final String unit}) = _$_UnitValueDto;
  const _UnitValueDto._() : super._();

  factory _UnitValueDto.fromJson(Map<String, dynamic> json) =
      _$_UnitValueDto.fromJson;

  @override
  double get value;
  @override
  String get unit;
  @override
  @JsonKey(ignore: true)
  _$$_UnitValueDtoCopyWith<_$_UnitValueDto> get copyWith =>
      throw _privateConstructorUsedError;
}
