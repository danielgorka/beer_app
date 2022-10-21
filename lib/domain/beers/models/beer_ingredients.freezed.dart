// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_ingredients.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerIngredients {
  List<BeerIngredientsMalt> get malt => throw _privateConstructorUsedError;
  List<BeerIngredientsHop> get hops => throw _privateConstructorUsedError;
  BeerIngredientsYeast? get yeast => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerIngredientsCopyWith<BeerIngredients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerIngredientsCopyWith<$Res> {
  factory $BeerIngredientsCopyWith(
          BeerIngredients value, $Res Function(BeerIngredients) then) =
      _$BeerIngredientsCopyWithImpl<$Res, BeerIngredients>;
  @useResult
  $Res call(
      {List<BeerIngredientsMalt> malt,
      List<BeerIngredientsHop> hops,
      BeerIngredientsYeast? yeast});
}

/// @nodoc
class _$BeerIngredientsCopyWithImpl<$Res, $Val extends BeerIngredients>
    implements $BeerIngredientsCopyWith<$Res> {
  _$BeerIngredientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malt = null,
    Object? hops = null,
    Object? yeast = freezed,
  }) {
    return _then(_value.copyWith(
      malt: null == malt
          ? _value.malt
          : malt // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsMalt>,
      hops: null == hops
          ? _value.hops
          : hops // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsHop>,
      yeast: freezed == yeast
          ? _value.yeast
          : yeast // ignore: cast_nullable_to_non_nullable
              as BeerIngredientsYeast?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeerIngredientsCopyWith<$Res>
    implements $BeerIngredientsCopyWith<$Res> {
  factory _$$_BeerIngredientsCopyWith(
          _$_BeerIngredients value, $Res Function(_$_BeerIngredients) then) =
      __$$_BeerIngredientsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BeerIngredientsMalt> malt,
      List<BeerIngredientsHop> hops,
      BeerIngredientsYeast? yeast});
}

/// @nodoc
class __$$_BeerIngredientsCopyWithImpl<$Res>
    extends _$BeerIngredientsCopyWithImpl<$Res, _$_BeerIngredients>
    implements _$$_BeerIngredientsCopyWith<$Res> {
  __$$_BeerIngredientsCopyWithImpl(
      _$_BeerIngredients _value, $Res Function(_$_BeerIngredients) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? malt = null,
    Object? hops = null,
    Object? yeast = freezed,
  }) {
    return _then(_$_BeerIngredients(
      malt: null == malt
          ? _value._malt
          : malt // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsMalt>,
      hops: null == hops
          ? _value._hops
          : hops // ignore: cast_nullable_to_non_nullable
              as List<BeerIngredientsHop>,
      yeast: freezed == yeast
          ? _value.yeast
          : yeast // ignore: cast_nullable_to_non_nullable
              as BeerIngredientsYeast?,
    ));
  }
}

/// @nodoc

class _$_BeerIngredients implements _BeerIngredients {
  _$_BeerIngredients(
      {required final List<BeerIngredientsMalt> malt,
      required final List<BeerIngredientsHop> hops,
      required this.yeast})
      : _malt = malt,
        _hops = hops;

  final List<BeerIngredientsMalt> _malt;
  @override
  List<BeerIngredientsMalt> get malt {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_malt);
  }

  final List<BeerIngredientsHop> _hops;
  @override
  List<BeerIngredientsHop> get hops {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hops);
  }

  @override
  final BeerIngredientsYeast? yeast;

  @override
  String toString() {
    return 'BeerIngredients(malt: $malt, hops: $hops, yeast: $yeast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerIngredients &&
            const DeepCollectionEquality().equals(other._malt, _malt) &&
            const DeepCollectionEquality().equals(other._hops, _hops) &&
            (identical(other.yeast, yeast) || other.yeast == yeast));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_malt),
      const DeepCollectionEquality().hash(_hops),
      yeast);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerIngredientsCopyWith<_$_BeerIngredients> get copyWith =>
      __$$_BeerIngredientsCopyWithImpl<_$_BeerIngredients>(this, _$identity);
}

abstract class _BeerIngredients implements BeerIngredients {
  factory _BeerIngredients(
      {required final List<BeerIngredientsMalt> malt,
      required final List<BeerIngredientsHop> hops,
      required final BeerIngredientsYeast? yeast}) = _$_BeerIngredients;

  @override
  List<BeerIngredientsMalt> get malt;
  @override
  List<BeerIngredientsHop> get hops;
  @override
  BeerIngredientsYeast? get yeast;
  @override
  @JsonKey(ignore: true)
  _$$_BeerIngredientsCopyWith<_$_BeerIngredients> get copyWith =>
      throw _privateConstructorUsedError;
}
