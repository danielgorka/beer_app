// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerMethod {
  List<BeerMash> get mashTemp => throw _privateConstructorUsedError;
  BeerFermentation get fermentation => throw _privateConstructorUsedError;
  BeerTwist get twist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerMethodCopyWith<BeerMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerMethodCopyWith<$Res> {
  factory $BeerMethodCopyWith(
          BeerMethod value, $Res Function(BeerMethod) then) =
      _$BeerMethodCopyWithImpl<$Res, BeerMethod>;
  @useResult
  $Res call(
      {List<BeerMash> mashTemp,
      BeerFermentation fermentation,
      BeerTwist twist});

  $BeerFermentationCopyWith<$Res> get fermentation;
}

/// @nodoc
class _$BeerMethodCopyWithImpl<$Res, $Val extends BeerMethod>
    implements $BeerMethodCopyWith<$Res> {
  _$BeerMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mashTemp = null,
    Object? fermentation = null,
    Object? twist = null,
  }) {
    return _then(_value.copyWith(
      mashTemp: null == mashTemp
          ? _value.mashTemp
          : mashTemp // ignore: cast_nullable_to_non_nullable
              as List<BeerMash>,
      fermentation: null == fermentation
          ? _value.fermentation
          : fermentation // ignore: cast_nullable_to_non_nullable
              as BeerFermentation,
      twist: null == twist
          ? _value.twist
          : twist // ignore: cast_nullable_to_non_nullable
              as BeerTwist,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerFermentationCopyWith<$Res> get fermentation {
    return $BeerFermentationCopyWith<$Res>(_value.fermentation, (value) {
      return _then(_value.copyWith(fermentation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeerMethodCopyWith<$Res>
    implements $BeerMethodCopyWith<$Res> {
  factory _$$_BeerMethodCopyWith(
          _$_BeerMethod value, $Res Function(_$_BeerMethod) then) =
      __$$_BeerMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BeerMash> mashTemp,
      BeerFermentation fermentation,
      BeerTwist twist});

  @override
  $BeerFermentationCopyWith<$Res> get fermentation;
}

/// @nodoc
class __$$_BeerMethodCopyWithImpl<$Res>
    extends _$BeerMethodCopyWithImpl<$Res, _$_BeerMethod>
    implements _$$_BeerMethodCopyWith<$Res> {
  __$$_BeerMethodCopyWithImpl(
      _$_BeerMethod _value, $Res Function(_$_BeerMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mashTemp = null,
    Object? fermentation = null,
    Object? twist = null,
  }) {
    return _then(_$_BeerMethod(
      mashTemp: null == mashTemp
          ? _value._mashTemp
          : mashTemp // ignore: cast_nullable_to_non_nullable
              as List<BeerMash>,
      fermentation: null == fermentation
          ? _value.fermentation
          : fermentation // ignore: cast_nullable_to_non_nullable
              as BeerFermentation,
      twist: null == twist
          ? _value.twist
          : twist // ignore: cast_nullable_to_non_nullable
              as BeerTwist,
    ));
  }
}

/// @nodoc

class _$_BeerMethod implements _BeerMethod {
  _$_BeerMethod(
      {required final List<BeerMash> mashTemp,
      required this.fermentation,
      required this.twist})
      : _mashTemp = mashTemp;

  final List<BeerMash> _mashTemp;
  @override
  List<BeerMash> get mashTemp {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mashTemp);
  }

  @override
  final BeerFermentation fermentation;
  @override
  final BeerTwist twist;

  @override
  String toString() {
    return 'BeerMethod(mashTemp: $mashTemp, fermentation: $fermentation, twist: $twist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerMethod &&
            const DeepCollectionEquality().equals(other._mashTemp, _mashTemp) &&
            (identical(other.fermentation, fermentation) ||
                other.fermentation == fermentation) &&
            (identical(other.twist, twist) || other.twist == twist));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_mashTemp), fermentation, twist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerMethodCopyWith<_$_BeerMethod> get copyWith =>
      __$$_BeerMethodCopyWithImpl<_$_BeerMethod>(this, _$identity);
}

abstract class _BeerMethod implements BeerMethod {
  factory _BeerMethod(
      {required final List<BeerMash> mashTemp,
      required final BeerFermentation fermentation,
      required final BeerTwist twist}) = _$_BeerMethod;

  @override
  List<BeerMash> get mashTemp;
  @override
  BeerFermentation get fermentation;
  @override
  BeerTwist get twist;
  @override
  @JsonKey(ignore: true)
  _$$_BeerMethodCopyWith<_$_BeerMethod> get copyWith =>
      throw _privateConstructorUsedError;
}
