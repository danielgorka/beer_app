// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_ingredients_malt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerIngredientsMalt {
  BeerMaltName get name => throw _privateConstructorUsedError;
  BeerMaltAmount get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerIngredientsMaltCopyWith<BeerIngredientsMalt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerIngredientsMaltCopyWith<$Res> {
  factory $BeerIngredientsMaltCopyWith(
          BeerIngredientsMalt value, $Res Function(BeerIngredientsMalt) then) =
      _$BeerIngredientsMaltCopyWithImpl<$Res, BeerIngredientsMalt>;
  @useResult
  $Res call({BeerMaltName name, BeerMaltAmount amount});
}

/// @nodoc
class _$BeerIngredientsMaltCopyWithImpl<$Res, $Val extends BeerIngredientsMalt>
    implements $BeerIngredientsMaltCopyWith<$Res> {
  _$BeerIngredientsMaltCopyWithImpl(this._value, this._then);

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
              as BeerMaltName,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BeerMaltAmount,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeerIngredientsMaltCopyWith<$Res>
    implements $BeerIngredientsMaltCopyWith<$Res> {
  factory _$$_BeerIngredientsMaltCopyWith(_$_BeerIngredientsMalt value,
          $Res Function(_$_BeerIngredientsMalt) then) =
      __$$_BeerIngredientsMaltCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerMaltName name, BeerMaltAmount amount});
}

/// @nodoc
class __$$_BeerIngredientsMaltCopyWithImpl<$Res>
    extends _$BeerIngredientsMaltCopyWithImpl<$Res, _$_BeerIngredientsMalt>
    implements _$$_BeerIngredientsMaltCopyWith<$Res> {
  __$$_BeerIngredientsMaltCopyWithImpl(_$_BeerIngredientsMalt _value,
      $Res Function(_$_BeerIngredientsMalt) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$_BeerIngredientsMalt(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as BeerMaltName,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as BeerMaltAmount,
    ));
  }
}

/// @nodoc

class _$_BeerIngredientsMalt implements _BeerIngredientsMalt {
  _$_BeerIngredientsMalt({required this.name, required this.amount});

  @override
  final BeerMaltName name;
  @override
  final BeerMaltAmount amount;

  @override
  String toString() {
    return 'BeerIngredientsMalt(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerIngredientsMalt &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerIngredientsMaltCopyWith<_$_BeerIngredientsMalt> get copyWith =>
      __$$_BeerIngredientsMaltCopyWithImpl<_$_BeerIngredientsMalt>(
          this, _$identity);
}

abstract class _BeerIngredientsMalt implements BeerIngredientsMalt {
  factory _BeerIngredientsMalt(
      {required final BeerMaltName name,
      required final BeerMaltAmount amount}) = _$_BeerIngredientsMalt;

  @override
  BeerMaltName get name;
  @override
  BeerMaltAmount get amount;
  @override
  @JsonKey(ignore: true)
  _$$_BeerIngredientsMaltCopyWith<_$_BeerIngredientsMalt> get copyWith =>
      throw _privateConstructorUsedError;
}
