// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_mash_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeerMashDto _$BeerMashDtoFromJson(Map<String, dynamic> json) {
  return _BeerMashDto.fromJson(json);
}

/// @nodoc
mixin _$BeerMashDto {
  UnitValueDto get temp => throw _privateConstructorUsedError;
  int? get duration => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerMashDtoCopyWith<BeerMashDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerMashDtoCopyWith<$Res> {
  factory $BeerMashDtoCopyWith(
          BeerMashDto value, $Res Function(BeerMashDto) then) =
      _$BeerMashDtoCopyWithImpl<$Res, BeerMashDto>;
  @useResult
  $Res call({UnitValueDto temp, int? duration});

  $UnitValueDtoCopyWith<$Res> get temp;
}

/// @nodoc
class _$BeerMashDtoCopyWithImpl<$Res, $Val extends BeerMashDto>
    implements $BeerMashDtoCopyWith<$Res> {
  _$BeerMashDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? duration = freezed,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_BeerMashDtoCopyWith<$Res>
    implements $BeerMashDtoCopyWith<$Res> {
  factory _$$_BeerMashDtoCopyWith(
          _$_BeerMashDto value, $Res Function(_$_BeerMashDto) then) =
      __$$_BeerMashDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UnitValueDto temp, int? duration});

  @override
  $UnitValueDtoCopyWith<$Res> get temp;
}

/// @nodoc
class __$$_BeerMashDtoCopyWithImpl<$Res>
    extends _$BeerMashDtoCopyWithImpl<$Res, _$_BeerMashDto>
    implements _$$_BeerMashDtoCopyWith<$Res> {
  __$$_BeerMashDtoCopyWithImpl(
      _$_BeerMashDto _value, $Res Function(_$_BeerMashDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? duration = freezed,
  }) {
    return _then(_$_BeerMashDto(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BeerMashDto extends _BeerMashDto {
  const _$_BeerMashDto({required this.temp, required this.duration})
      : super._();

  factory _$_BeerMashDto.fromJson(Map<String, dynamic> json) =>
      _$$_BeerMashDtoFromJson(json);

  @override
  final UnitValueDto temp;
  @override
  final int? duration;

  @override
  String toString() {
    return 'BeerMashDto(temp: $temp, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerMashDto &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, temp, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerMashDtoCopyWith<_$_BeerMashDto> get copyWith =>
      __$$_BeerMashDtoCopyWithImpl<_$_BeerMashDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerMashDtoToJson(
      this,
    );
  }
}

abstract class _BeerMashDto extends BeerMashDto {
  const factory _BeerMashDto(
      {required final UnitValueDto temp,
      required final int? duration}) = _$_BeerMashDto;
  const _BeerMashDto._() : super._();

  factory _BeerMashDto.fromJson(Map<String, dynamic> json) =
      _$_BeerMashDto.fromJson;

  @override
  UnitValueDto get temp;
  @override
  int? get duration;
  @override
  @JsonKey(ignore: true)
  _$$_BeerMashDtoCopyWith<_$_BeerMashDto> get copyWith =>
      throw _privateConstructorUsedError;
}
