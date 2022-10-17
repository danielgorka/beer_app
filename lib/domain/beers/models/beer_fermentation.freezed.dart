// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_fermentation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerFermentation {
  BeerFermentationTemp get temp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerFermentationCopyWith<BeerFermentation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerFermentationCopyWith<$Res> {
  factory $BeerFermentationCopyWith(
          BeerFermentation value, $Res Function(BeerFermentation) then) =
      _$BeerFermentationCopyWithImpl<$Res, BeerFermentation>;
  @useResult
  $Res call({BeerFermentationTemp temp});
}

/// @nodoc
class _$BeerFermentationCopyWithImpl<$Res, $Val extends BeerFermentation>
    implements $BeerFermentationCopyWith<$Res> {
  _$BeerFermentationCopyWithImpl(this._value, this._then);

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
              as BeerFermentationTemp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeerFermentationCopyWith<$Res>
    implements $BeerFermentationCopyWith<$Res> {
  factory _$$_BeerFermentationCopyWith(
          _$_BeerFermentation value, $Res Function(_$_BeerFermentation) then) =
      __$$_BeerFermentationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerFermentationTemp temp});
}

/// @nodoc
class __$$_BeerFermentationCopyWithImpl<$Res>
    extends _$BeerFermentationCopyWithImpl<$Res, _$_BeerFermentation>
    implements _$$_BeerFermentationCopyWith<$Res> {
  __$$_BeerFermentationCopyWithImpl(
      _$_BeerFermentation _value, $Res Function(_$_BeerFermentation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
  }) {
    return _then(_$_BeerFermentation(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as BeerFermentationTemp,
    ));
  }
}

/// @nodoc

class _$_BeerFermentation implements _BeerFermentation {
  _$_BeerFermentation({required this.temp});

  @override
  final BeerFermentationTemp temp;

  @override
  String toString() {
    return 'BeerFermentation(temp: $temp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerFermentation &&
            (identical(other.temp, temp) || other.temp == temp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerFermentationCopyWith<_$_BeerFermentation> get copyWith =>
      __$$_BeerFermentationCopyWithImpl<_$_BeerFermentation>(this, _$identity);
}

abstract class _BeerFermentation implements BeerFermentation {
  factory _BeerFermentation({required final BeerFermentationTemp temp}) =
      _$_BeerFermentation;

  @override
  BeerFermentationTemp get temp;
  @override
  @JsonKey(ignore: true)
  _$$_BeerFermentationCopyWith<_$_BeerFermentation> get copyWith =>
      throw _privateConstructorUsedError;
}
