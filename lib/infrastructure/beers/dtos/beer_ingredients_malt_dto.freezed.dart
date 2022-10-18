// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_ingredients_malt_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeerIngredientsMaltDto _$BeerIngredientsMaltDtoFromJson(
    Map<String, dynamic> json) {
  return _BeerIngredientsMaltDto.fromJson(json);
}

/// @nodoc
mixin _$BeerIngredientsMaltDto {
  String get name => throw _privateConstructorUsedError;
  UnitValueDto get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerIngredientsMaltDtoCopyWith<BeerIngredientsMaltDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerIngredientsMaltDtoCopyWith<$Res> {
  factory $BeerIngredientsMaltDtoCopyWith(BeerIngredientsMaltDto value,
          $Res Function(BeerIngredientsMaltDto) then) =
      _$BeerIngredientsMaltDtoCopyWithImpl<$Res, BeerIngredientsMaltDto>;
  @useResult
  $Res call({String name, UnitValueDto amount});

  $UnitValueDtoCopyWith<$Res> get amount;
}

/// @nodoc
class _$BeerIngredientsMaltDtoCopyWithImpl<$Res,
        $Val extends BeerIngredientsMaltDto>
    implements $BeerIngredientsMaltDtoCopyWith<$Res> {
  _$BeerIngredientsMaltDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
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
abstract class _$$_BeerIngredientsMaltDtoCopyWith<$Res>
    implements $BeerIngredientsMaltDtoCopyWith<$Res> {
  factory _$$_BeerIngredientsMaltDtoCopyWith(_$_BeerIngredientsMaltDto value,
          $Res Function(_$_BeerIngredientsMaltDto) then) =
      __$$_BeerIngredientsMaltDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, UnitValueDto amount});

  @override
  $UnitValueDtoCopyWith<$Res> get amount;
}

/// @nodoc
class __$$_BeerIngredientsMaltDtoCopyWithImpl<$Res>
    extends _$BeerIngredientsMaltDtoCopyWithImpl<$Res,
        _$_BeerIngredientsMaltDto>
    implements _$$_BeerIngredientsMaltDtoCopyWith<$Res> {
  __$$_BeerIngredientsMaltDtoCopyWithImpl(_$_BeerIngredientsMaltDto _value,
      $Res Function(_$_BeerIngredientsMaltDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$_BeerIngredientsMaltDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as UnitValueDto,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BeerIngredientsMaltDto extends _BeerIngredientsMaltDto {
  const _$_BeerIngredientsMaltDto({required this.name, required this.amount})
      : super._();

  factory _$_BeerIngredientsMaltDto.fromJson(Map<String, dynamic> json) =>
      _$$_BeerIngredientsMaltDtoFromJson(json);

  @override
  final String name;
  @override
  final UnitValueDto amount;

  @override
  String toString() {
    return 'BeerIngredientsMaltDto(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerIngredientsMaltDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerIngredientsMaltDtoCopyWith<_$_BeerIngredientsMaltDto> get copyWith =>
      __$$_BeerIngredientsMaltDtoCopyWithImpl<_$_BeerIngredientsMaltDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerIngredientsMaltDtoToJson(
      this,
    );
  }
}

abstract class _BeerIngredientsMaltDto extends BeerIngredientsMaltDto {
  const factory _BeerIngredientsMaltDto(
      {required final String name,
      required final UnitValueDto amount}) = _$_BeerIngredientsMaltDto;
  const _BeerIngredientsMaltDto._() : super._();

  factory _BeerIngredientsMaltDto.fromJson(Map<String, dynamic> json) =
      _$_BeerIngredientsMaltDto.fromJson;

  @override
  String get name;
  @override
  UnitValueDto get amount;
  @override
  @JsonKey(ignore: true)
  _$$_BeerIngredientsMaltDtoCopyWith<_$_BeerIngredientsMaltDto> get copyWith =>
      throw _privateConstructorUsedError;
}
