// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_ingredients_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeerIngredientsDto _$BeerIngredientsDtoFromJson(Map<String, dynamic> json) {
  return _BeerIngredientsDto.fromJson(json);
}

/// @nodoc
mixin _$BeerIngredientsDto {
  List<BeerIngredientsMaltDto> get malt => throw _privateConstructorUsedError;
  List<BeerIngredientsHopDto> get hops => throw _privateConstructorUsedError;
  String get yeast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeerIngredientsDtoCopyWith<BeerIngredientsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerIngredientsDtoCopyWith<$Res> {
  factory $BeerIngredientsDtoCopyWith(
          BeerIngredientsDto value, $Res Function(BeerIngredientsDto) then) =
      _$BeerIngredientsDtoCopyWithImpl<$Res, BeerIngredientsDto>;
  @useResult
  $Res call(
      {List<BeerIngredientsMaltDto> malt,
      List<BeerIngredientsHopDto> hops,
      String yeast});
}

/// @nodoc
class _$BeerIngredientsDtoCopyWithImpl<$Res, $Val extends BeerIngredientsDto>
    implements $BeerIngredientsDtoCopyWith<$Res> {
  _$BeerIngredientsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malt = null,
    Object? hops = null,
    Object? yeast = null,
  }) {
    return _then(_value.copyWith(
      malt: null == malt
          ? _value.malt
          : malt // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsMaltDto>,
      hops: null == hops
          ? _value.hops
          : hops // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsHopDto>,
      yeast: null == yeast
          ? _value.yeast
          : yeast // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeerIngredientsDtoCopyWith<$Res>
    implements $BeerIngredientsDtoCopyWith<$Res> {
  factory _$$_BeerIngredientsDtoCopyWith(_$_BeerIngredientsDto value,
          $Res Function(_$_BeerIngredientsDto) then) =
      __$$_BeerIngredientsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BeerIngredientsMaltDto> malt,
      List<BeerIngredientsHopDto> hops,
      String yeast});
}

/// @nodoc
class __$$_BeerIngredientsDtoCopyWithImpl<$Res>
    extends _$BeerIngredientsDtoCopyWithImpl<$Res, _$_BeerIngredientsDto>
    implements _$$_BeerIngredientsDtoCopyWith<$Res> {
  __$$_BeerIngredientsDtoCopyWithImpl(
      _$_BeerIngredientsDto _value, $Res Function(_$_BeerIngredientsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malt = null,
    Object? hops = null,
    Object? yeast = null,
  }) {
    return _then(_$_BeerIngredientsDto(
      malt: null == malt
          ? _value._malt
          : malt // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsMaltDto>,
      hops: null == hops
          ? _value._hops
          : hops // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsHopDto>,
      yeast: null == yeast
          ? _value.yeast
          : yeast // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BeerIngredientsDto extends _BeerIngredientsDto {
  const _$_BeerIngredientsDto(
      {required final List<BeerIngredientsMaltDto> malt,
      required final List<BeerIngredientsHopDto> hops,
      required this.yeast})
      : _malt = malt,
        _hops = hops,
        super._();

  factory _$_BeerIngredientsDto.fromJson(Map<String, dynamic> json) =>
      _$$_BeerIngredientsDtoFromJson(json);

  final List<BeerIngredientsMaltDto> _malt;
  @override
  List<BeerIngredientsMaltDto> get malt {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_malt);
  }

  final List<BeerIngredientsHopDto> _hops;
  @override
  List<BeerIngredientsHopDto> get hops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hops);
  }

  @override
  final String yeast;

  @override
  String toString() {
    return 'BeerIngredientsDto(malt: $malt, hops: $hops, yeast: $yeast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerIngredientsDto &&
            const DeepCollectionEquality().equals(other._malt, _malt) &&
            const DeepCollectionEquality().equals(other._hops, _hops) &&
            (identical(other.yeast, yeast) || other.yeast == yeast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_malt),
      const DeepCollectionEquality().hash(_hops),
      yeast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerIngredientsDtoCopyWith<_$_BeerIngredientsDto> get copyWith =>
      __$$_BeerIngredientsDtoCopyWithImpl<_$_BeerIngredientsDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeerIngredientsDtoToJson(
      this,
    );
  }
}

abstract class _BeerIngredientsDto extends BeerIngredientsDto {
  const factory _BeerIngredientsDto(
      {required final List<BeerIngredientsMaltDto> malt,
      required final List<BeerIngredientsHopDto> hops,
      required final String yeast}) = _$_BeerIngredientsDto;
  const _BeerIngredientsDto._() : super._();

  factory _BeerIngredientsDto.fromJson(Map<String, dynamic> json) =
      _$_BeerIngredientsDto.fromJson;

  @override
  List<BeerIngredientsMaltDto> get malt;
  @override
  List<BeerIngredientsHopDto> get hops;
  @override
  String get yeast;
  @override
  @JsonKey(ignore: true)
  _$$_BeerIngredientsDtoCopyWith<_$_BeerIngredientsDto> get copyWith =>
      throw _privateConstructorUsedError;
}
