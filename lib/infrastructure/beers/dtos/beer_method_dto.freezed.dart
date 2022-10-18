// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_method_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeerMethodDto _$BeerMethodDtoFromJson(Map<String, dynamic> json) {
  return _BeerMethodDto.fromJson(json);
}

/// @nodoc
mixin _$BeerMethodDto {
  List<BeerMashDto> get mashTemp => throw _privateConstructorUsedError;
  BeerFermentationDto get fermentation => throw _privateConstructorUsedError;
  String? get twist => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerMethodDtoCopyWith<BeerMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerMethodDtoCopyWith<$Res> {
  factory $BeerMethodDtoCopyWith(
          BeerMethodDto value, $Res Function(BeerMethodDto) then) =
      _$BeerMethodDtoCopyWithImpl<$Res, BeerMethodDto>;
  @useResult
  $Res call(
      {List<BeerMashDto> mashTemp,
      BeerFermentationDto fermentation,
      String? twist});

  $BeerFermentationDtoCopyWith<$Res> get fermentation;
}

/// @nodoc
class _$BeerMethodDtoCopyWithImpl<$Res, $Val extends BeerMethodDto>
    implements $BeerMethodDtoCopyWith<$Res> {
  _$BeerMethodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mashTemp = null,
    Object? fermentation = null,
    Object? twist = freezed,
  }) {
    return _then(_value.copyWith(
      mashTemp: null == mashTemp
          ? _value.mashTemp
          : mashTemp // ignore: cast_nullable_to_non_nullable
              as List<BeerMashDto>,
      fermentation: null == fermentation
          ? _value.fermentation
          : fermentation // ignore: cast_nullable_to_non_nullable
              as BeerFermentationDto,
      twist: freezed == twist
          ? _value.twist
          : twist // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerFermentationDtoCopyWith<$Res> get fermentation {
    return $BeerFermentationDtoCopyWith<$Res>(_value.fermentation, (value) {
      return _then(_value.copyWith(fermentation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeerMethodDtoCopyWith<$Res>
    implements $BeerMethodDtoCopyWith<$Res> {
  factory _$$_BeerMethodDtoCopyWith(
          _$_BeerMethodDto value, $Res Function(_$_BeerMethodDto) then) =
      __$$_BeerMethodDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BeerMashDto> mashTemp,
      BeerFermentationDto fermentation,
      String? twist});

  @override
  $BeerFermentationDtoCopyWith<$Res> get fermentation;
}

/// @nodoc
class __$$_BeerMethodDtoCopyWithImpl<$Res>
    extends _$BeerMethodDtoCopyWithImpl<$Res, _$_BeerMethodDto>
    implements _$$_BeerMethodDtoCopyWith<$Res> {
  __$$_BeerMethodDtoCopyWithImpl(
      _$_BeerMethodDto _value, $Res Function(_$_BeerMethodDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mashTemp = null,
    Object? fermentation = null,
    Object? twist = freezed,
  }) {
    return _then(_$_BeerMethodDto(
      mashTemp: null == mashTemp
          ? _value._mashTemp
          : mashTemp // ignore: cast_nullable_to_non_nullable
              as List<BeerMashDto>,
      fermentation: null == fermentation
          ? _value.fermentation
          : fermentation // ignore: cast_nullable_to_non_nullable
              as BeerFermentationDto,
      twist: freezed == twist
          ? _value.twist
          : twist // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BeerMethodDto extends _BeerMethodDto {
  const _$_BeerMethodDto(
      {required final List<BeerMashDto> mashTemp,
      required this.fermentation,
      required this.twist})
      : _mashTemp = mashTemp,
        super._();

  factory _$_BeerMethodDto.fromJson(Map<String, dynamic> json) =>
      _$$_BeerMethodDtoFromJson(json);

  final List<BeerMashDto> _mashTemp;
  @override
  List<BeerMashDto> get mashTemp {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mashTemp);
  }

  @override
  final BeerFermentationDto fermentation;
  @override
  final String? twist;

  @override
  String toString() {
    return 'BeerMethodDto(mashTemp: $mashTemp, fermentation: $fermentation, twist: $twist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerMethodDto &&
            const DeepCollectionEquality().equals(other._mashTemp, _mashTemp) &&
            (identical(other.fermentation, fermentation) ||
                other.fermentation == fermentation) &&
            (identical(other.twist, twist) || other.twist == twist));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_mashTemp), fermentation, twist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerMethodDtoCopyWith<_$_BeerMethodDto> get copyWith =>
      __$$_BeerMethodDtoCopyWithImpl<_$_BeerMethodDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerMethodDtoToJson(
      this,
    );
  }
}

abstract class _BeerMethodDto extends BeerMethodDto {
  const factory _BeerMethodDto(
      {required final List<BeerMashDto> mashTemp,
      required final BeerFermentationDto fermentation,
      required final String? twist}) = _$_BeerMethodDto;
  const _BeerMethodDto._() : super._();

  factory _BeerMethodDto.fromJson(Map<String, dynamic> json) =
      _$_BeerMethodDto.fromJson;

  @override
  List<BeerMashDto> get mashTemp;
  @override
  BeerFermentationDto get fermentation;
  @override
  String? get twist;
  @override
  @JsonKey(ignore: true)
  _$$_BeerMethodDtoCopyWith<_$_BeerMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}
