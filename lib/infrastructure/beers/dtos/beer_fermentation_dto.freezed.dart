// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_fermentation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeerFermentationDto _$BeerFermentationDtoFromJson(Map<String, dynamic> json) {
  return _BeerFermentationDto.fromJson(json);
}

/// @nodoc
mixin _$BeerFermentationDto {
  UnitValueDto get temp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerFermentationDtoCopyWith<BeerFermentationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerFermentationDtoCopyWith<$Res> {
  factory $BeerFermentationDtoCopyWith(
          BeerFermentationDto value, $Res Function(BeerFermentationDto) then) =
      _$BeerFermentationDtoCopyWithImpl<$Res, BeerFermentationDto>;
  @useResult
  $Res call({UnitValueDto temp});

  $UnitValueDtoCopyWith<$Res> get temp;
}

/// @nodoc
class _$BeerFermentationDtoCopyWithImpl<$Res, $Val extends BeerFermentationDto>
    implements $BeerFermentationDtoCopyWith<$Res> {
  _$BeerFermentationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitValueDtoCopyWith<$Res> get temp {
    return $UnitValueDtoCopyWith<$Res>(_value.temp, (value) {
      return _then(_value.copyWith(temp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeerFermentationDtoCopyWith<$Res>
    implements $BeerFermentationDtoCopyWith<$Res> {
  factory _$$_BeerFermentationDtoCopyWith(_$_BeerFermentationDto value,
          $Res Function(_$_BeerFermentationDto) then) =
      __$$_BeerFermentationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UnitValueDto temp});

  @override
  $UnitValueDtoCopyWith<$Res> get temp;
}

/// @nodoc
class __$$_BeerFermentationDtoCopyWithImpl<$Res>
    extends _$BeerFermentationDtoCopyWithImpl<$Res, _$_BeerFermentationDto>
    implements _$$_BeerFermentationDtoCopyWith<$Res> {
  __$$_BeerFermentationDtoCopyWithImpl(_$_BeerFermentationDto _value,
      $Res Function(_$_BeerFermentationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
  }) {
    return _then(_$_BeerFermentationDto(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BeerFermentationDto extends _BeerFermentationDto {
  const _$_BeerFermentationDto({required this.temp}) : super._();

  factory _$_BeerFermentationDto.fromJson(Map<String, dynamic> json) =>
      _$$_BeerFermentationDtoFromJson(json);

  @override
  final UnitValueDto temp;

  @override
  String toString() {
    return 'BeerFermentationDto(temp: $temp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerFermentationDto &&
            (identical(other.temp, temp) || other.temp == temp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, temp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerFermentationDtoCopyWith<_$_BeerFermentationDto> get copyWith =>
      __$$_BeerFermentationDtoCopyWithImpl<_$_BeerFermentationDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerFermentationDtoToJson(
      this,
    );
  }
}

abstract class _BeerFermentationDto extends BeerFermentationDto {
  const factory _BeerFermentationDto({required final UnitValueDto temp}) =
      _$_BeerFermentationDto;
  const _BeerFermentationDto._() : super._();

  factory _BeerFermentationDto.fromJson(Map<String, dynamic> json) =
      _$_BeerFermentationDto.fromJson;

  @override
  UnitValueDto get temp;
  @override
  @JsonKey(ignore: true)
  _$$_BeerFermentationDtoCopyWith<_$_BeerFermentationDto> get copyWith =>
      throw _privateConstructorUsedError;
}
