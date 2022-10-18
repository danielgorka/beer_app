// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_ingredients_hop_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeerIngredientsHopDto _$BeerIngredientsHopDtoFromJson(
    Map<String, dynamic> json) {
  return _BeerIngredientsHopDto.fromJson(json);
}

/// @nodoc
mixin _$BeerIngredientsHopDto {
  String get name => throw _privateConstructorUsedError;
  UnitValueDto get amount => throw _privateConstructorUsedError;
  String get add => throw _privateConstructorUsedError;
  String get attribute => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerIngredientsHopDtoCopyWith<BeerIngredientsHopDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerIngredientsHopDtoCopyWith<$Res> {
  factory $BeerIngredientsHopDtoCopyWith(BeerIngredientsHopDto value,
          $Res Function(BeerIngredientsHopDto) then) =
      _$BeerIngredientsHopDtoCopyWithImpl<$Res, BeerIngredientsHopDto>;
  @useResult
  $Res call({String name, UnitValueDto amount, String add, String attribute});

  $UnitValueDtoCopyWith<$Res> get amount;
}

/// @nodoc
class _$BeerIngredientsHopDtoCopyWithImpl<$Res,
        $Val extends BeerIngredientsHopDto>
    implements $BeerIngredientsHopDtoCopyWith<$Res> {
  _$BeerIngredientsHopDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? add = null,
    Object? attribute = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UnitValueDtoCopyWith<$Res> get amount {
    return $UnitValueDtoCopyWith<$Res>(_value.amount, (value) {
      return _then(_value.copyWith(amount: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeerIngredientsHopDtoCopyWith<$Res>
    implements $BeerIngredientsHopDtoCopyWith<$Res> {
  factory _$$_BeerIngredientsHopDtoCopyWith(_$_BeerIngredientsHopDto value,
          $Res Function(_$_BeerIngredientsHopDto) then) =
      __$$_BeerIngredientsHopDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, UnitValueDto amount, String add, String attribute});

  @override
  $UnitValueDtoCopyWith<$Res> get amount;
}

/// @nodoc
class __$$_BeerIngredientsHopDtoCopyWithImpl<$Res>
    extends _$BeerIngredientsHopDtoCopyWithImpl<$Res, _$_BeerIngredientsHopDto>
    implements _$$_BeerIngredientsHopDtoCopyWith<$Res> {
  __$$_BeerIngredientsHopDtoCopyWithImpl(_$_BeerIngredientsHopDto _value,
      $Res Function(_$_BeerIngredientsHopDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? add = null,
    Object? attribute = null,
  }) {
    return _then(_$_BeerIngredientsHopDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as String,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BeerIngredientsHopDto extends _BeerIngredientsHopDto {
  const _$_BeerIngredientsHopDto(
      {required this.name,
      required this.amount,
      required this.add,
      required this.attribute})
      : super._();

  factory _$_BeerIngredientsHopDto.fromJson(Map<String, dynamic> json) =>
      _$$_BeerIngredientsHopDtoFromJson(json);

  @override
  final String name;
  @override
  final UnitValueDto amount;
  @override
  final String add;
  @override
  final String attribute;

  @override
  String toString() {
    return 'BeerIngredientsHopDto(name: $name, amount: $amount, add: $add, attribute: $attribute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerIngredientsHopDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.add, add) || other.add == add) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount, add, attribute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerIngredientsHopDtoCopyWith<_$_BeerIngredientsHopDto> get copyWith =>
      __$$_BeerIngredientsHopDtoCopyWithImpl<_$_BeerIngredientsHopDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerIngredientsHopDtoToJson(
      this,
    );
  }
}

abstract class _BeerIngredientsHopDto extends BeerIngredientsHopDto {
  const factory _BeerIngredientsHopDto(
      {required final String name,
      required final UnitValueDto amount,
      required final String add,
      required final String attribute}) = _$_BeerIngredientsHopDto;
  const _BeerIngredientsHopDto._() : super._();

  factory _BeerIngredientsHopDto.fromJson(Map<String, dynamic> json) =
      _$_BeerIngredientsHopDto.fromJson;

  @override
  String get name;
  @override
  UnitValueDto get amount;
  @override
  String get add;
  @override
  String get attribute;
  @override
  @JsonKey(ignore: true)
  _$$_BeerIngredientsHopDtoCopyWith<_$_BeerIngredientsHopDto> get copyWith =>
      throw _privateConstructorUsedError;
}
