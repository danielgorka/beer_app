// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_ingredients_hop.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerIngredientsHop {
  BeerHopName get name => throw _privateConstructorUsedError;
  BeerHopAmount get amount => throw _privateConstructorUsedError;
  BeerHopAdd get add => throw _privateConstructorUsedError;
  BeerHopAttribute get attribute => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerIngredientsHopCopyWith<BeerIngredientsHop> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerIngredientsHopCopyWith<$Res> {
  factory $BeerIngredientsHopCopyWith(
          BeerIngredientsHop value, $Res Function(BeerIngredientsHop) then) =
      _$BeerIngredientsHopCopyWithImpl<$Res, BeerIngredientsHop>;
  @useResult
  $Res call(
      {BeerHopName name,
      BeerHopAmount amount,
      BeerHopAdd add,
      BeerHopAttribute attribute});
}

/// @nodoc
class _$BeerIngredientsHopCopyWithImpl<$Res, $Val extends BeerIngredientsHop>
    implements $BeerIngredientsHopCopyWith<$Res> {
  _$BeerIngredientsHopCopyWithImpl(this._value, this._then);

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
              as BeerHopName,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BeerHopAmount,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as BeerHopAdd,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as BeerHopAttribute,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeerIngredientsHopCopyWith<$Res>
    implements $BeerIngredientsHopCopyWith<$Res> {
  factory _$$_BeerIngredientsHopCopyWith(_$_BeerIngredientsHop value,
          $Res Function(_$_BeerIngredientsHop) then) =
      __$$_BeerIngredientsHopCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BeerHopName name,
      BeerHopAmount amount,
      BeerHopAdd add,
      BeerHopAttribute attribute});
}

/// @nodoc
class __$$_BeerIngredientsHopCopyWithImpl<$Res>
    extends _$BeerIngredientsHopCopyWithImpl<$Res, _$_BeerIngredientsHop>
    implements _$$_BeerIngredientsHopCopyWith<$Res> {
  __$$_BeerIngredientsHopCopyWithImpl(
      _$_BeerIngredientsHop _value, $Res Function(_$_BeerIngredientsHop) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
    Object? add = null,
    Object? attribute = null,
  }) {
    return _then(_$_BeerIngredientsHop(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as BeerHopName,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BeerHopAmount,
      add: null == add
          ? _value.add
          : add // ignore: cast_nullable_to_non_nullable
              as BeerHopAdd,
      attribute: null == attribute
          ? _value.attribute
          : attribute // ignore: cast_nullable_to_non_nullable
              as BeerHopAttribute,
    ));
  }
}

/// @nodoc

class _$_BeerIngredientsHop implements _BeerIngredientsHop {
  _$_BeerIngredientsHop(
      {required this.name,
      required this.amount,
      required this.add,
      required this.attribute});

  @override
  final BeerHopName name;
  @override
  final BeerHopAmount amount;
  @override
  final BeerHopAdd add;
  @override
  final BeerHopAttribute attribute;

  @override
  String toString() {
    return 'BeerIngredientsHop(name: $name, amount: $amount, add: $add, attribute: $attribute)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerIngredientsHop &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.add, add) || other.add == add) &&
            (identical(other.attribute, attribute) ||
                other.attribute == attribute));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, amount, add, attribute);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerIngredientsHopCopyWith<_$_BeerIngredientsHop> get copyWith =>
      __$$_BeerIngredientsHopCopyWithImpl<_$_BeerIngredientsHop>(
          this, _$identity);
}

abstract class _BeerIngredientsHop implements BeerIngredientsHop {
  factory _BeerIngredientsHop(
      {required final BeerHopName name,
      required final BeerHopAmount amount,
      required final BeerHopAdd add,
      required final BeerHopAttribute attribute}) = _$_BeerIngredientsHop;

  @override
  BeerHopName get name;
  @override
  BeerHopAmount get amount;
  @override
  BeerHopAdd get add;
  @override
  BeerHopAttribute get attribute;
  @override
  @JsonKey(ignore: true)
  _$$_BeerIngredientsHopCopyWith<_$_BeerIngredientsHop> get copyWith =>
      throw _privateConstructorUsedError;
}
