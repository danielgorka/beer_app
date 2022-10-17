// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_mash.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerMash {
  BeerMashTemp get temp => throw _privateConstructorUsedError;
  BeerMashDuration get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerMashCopyWith<BeerMash> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerMashCopyWith<$Res> {
  factory $BeerMashCopyWith(BeerMash value, $Res Function(BeerMash) then) =
      _$BeerMashCopyWithImpl<$Res, BeerMash>;
  @useResult
  $Res call({BeerMashTemp temp, BeerMashDuration duration});
}

/// @nodoc
class _$BeerMashCopyWithImpl<$Res, $Val extends BeerMash>
    implements $BeerMashCopyWith<$Res> {
  _$BeerMashCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as BeerMashTemp,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as BeerMashDuration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeerMashCopyWith<$Res> implements $BeerMashCopyWith<$Res> {
  factory _$$_BeerMashCopyWith(
          _$_BeerMash value, $Res Function(_$_BeerMash) then) =
      __$$_BeerMashCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BeerMashTemp temp, BeerMashDuration duration});
}

/// @nodoc
class __$$_BeerMashCopyWithImpl<$Res>
    extends _$BeerMashCopyWithImpl<$Res, _$_BeerMash>
    implements _$$_BeerMashCopyWith<$Res> {
  __$$_BeerMashCopyWithImpl(
      _$_BeerMash _value, $Res Function(_$_BeerMash) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? duration = null,
  }) {
    return _then(_$_BeerMash(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as BeerMashTemp,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as BeerMashDuration,
    ));
  }
}

/// @nodoc

class _$_BeerMash implements _BeerMash {
  _$_BeerMash({required this.temp, required this.duration});

  @override
  final BeerMashTemp temp;
  @override
  final BeerMashDuration duration;

  @override
  String toString() {
    return 'BeerMash(temp: $temp, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerMash &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, temp, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerMashCopyWith<_$_BeerMash> get copyWith =>
      __$$_BeerMashCopyWithImpl<_$_BeerMash>(this, _$identity);
}

abstract class _BeerMash implements BeerMash {
  factory _BeerMash(
      {required final BeerMashTemp temp,
      required final BeerMashDuration duration}) = _$_BeerMash;

  @override
  BeerMashTemp get temp;
  @override
  BeerMashDuration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_BeerMashCopyWith<_$_BeerMash> get copyWith =>
      throw _privateConstructorUsedError;
}
