// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beer_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeerDetailsEvent {
  int? get beerId => throw _privateConstructorUsedError;
  Beer? get beer => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? beerId, Beer? beer) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? beerId, Beer? beer)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? beerId, Beer? beer)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerDetailsEventCopyWith<BeerDetailsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerDetailsEventCopyWith<$Res> {
  factory $BeerDetailsEventCopyWith(
          BeerDetailsEvent value, $Res Function(BeerDetailsEvent) then) =
      _$BeerDetailsEventCopyWithImpl<$Res, BeerDetailsEvent>;
  @useResult
  $Res call({int? beerId, Beer? beer});

  $BeerCopyWith<$Res>? get beer;
}

/// @nodoc
class _$BeerDetailsEventCopyWithImpl<$Res, $Val extends BeerDetailsEvent>
    implements $BeerDetailsEventCopyWith<$Res> {
  _$BeerDetailsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beerId = freezed,
    Object? beer = freezed,
  }) {
    return _then(_value.copyWith(
      beerId: freezed == beerId
          ? _value.beerId
          : beerId // ignore: cast_nullable_to_non_nullable
              as int?,
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as Beer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerCopyWith<$Res>? get beer {
    if (_value.beer == null) {
      return null;
    }

    return $BeerCopyWith<$Res>(_value.beer!, (value) {
      return _then(_value.copyWith(beer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res>
    implements $BeerDetailsEventCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? beerId, Beer? beer});

  @override
  $BeerCopyWith<$Res>? get beer;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$BeerDetailsEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beerId = freezed,
    Object? beer = freezed,
  }) {
    return _then(_$_Init(
      beerId: freezed == beerId
          ? _value.beerId
          : beerId // ignore: cast_nullable_to_non_nullable
              as int?,
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as Beer?,
    ));
  }
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init({this.beerId, this.beer});

  @override
  final int? beerId;
  @override
  final Beer? beer;

  @override
  String toString() {
    return 'BeerDetailsEvent.init(beerId: $beerId, beer: $beer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Init &&
            (identical(other.beerId, beerId) || other.beerId == beerId) &&
            (identical(other.beer, beer) || other.beer == beer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beerId, beer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitCopyWith<_$_Init> get copyWith =>
      __$$_InitCopyWithImpl<_$_Init>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? beerId, Beer? beer) init,
  }) {
    return init(beerId, beer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? beerId, Beer? beer)? init,
  }) {
    return init?.call(beerId, beer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? beerId, Beer? beer)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(beerId, beer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements BeerDetailsEvent {
  const factory _Init({final int? beerId, final Beer? beer}) = _$_Init;

  @override
  int? get beerId;
  @override
  Beer? get beer;
  @override
  @JsonKey(ignore: true)
  _$$_InitCopyWith<_$_Init> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BeerDetailsState {
  bool get loading => throw _privateConstructorUsedError;
  ErrorType get errorType => throw _privateConstructorUsedError;
  Beer? get beer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeerDetailsStateCopyWith<BeerDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeerDetailsStateCopyWith<$Res> {
  factory $BeerDetailsStateCopyWith(
          BeerDetailsState value, $Res Function(BeerDetailsState) then) =
      _$BeerDetailsStateCopyWithImpl<$Res, BeerDetailsState>;
  @useResult
  $Res call({bool loading, ErrorType errorType, Beer? beer});

  $BeerCopyWith<$Res>? get beer;
}

/// @nodoc
class _$BeerDetailsStateCopyWithImpl<$Res, $Val extends BeerDetailsState>
    implements $BeerDetailsStateCopyWith<$Res> {
  _$BeerDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorType = null,
    Object? beer = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorType: null == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as ErrorType,
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as Beer?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerCopyWith<$Res>? get beer {
    if (_value.beer == null) {
      return null;
    }

    return $BeerCopyWith<$Res>(_value.beer!, (value) {
      return _then(_value.copyWith(beer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BeerDetailsStateCopyWith<$Res>
    implements $BeerDetailsStateCopyWith<$Res> {
  factory _$$_BeerDetailsStateCopyWith(
          _$_BeerDetailsState value, $Res Function(_$_BeerDetailsState) then) =
      __$$_BeerDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, ErrorType errorType, Beer? beer});

  @override
  $BeerCopyWith<$Res>? get beer;
}

/// @nodoc
class __$$_BeerDetailsStateCopyWithImpl<$Res>
    extends _$BeerDetailsStateCopyWithImpl<$Res, _$_BeerDetailsState>
    implements _$$_BeerDetailsStateCopyWith<$Res> {
  __$$_BeerDetailsStateCopyWithImpl(
      _$_BeerDetailsState _value, $Res Function(_$_BeerDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorType = null,
    Object? beer = freezed,
  }) {
    return _then(_$_BeerDetailsState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorType: null == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as ErrorType,
      beer: freezed == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as Beer?,
    ));
  }
}

/// @nodoc

class _$_BeerDetailsState implements _BeerDetailsState {
  const _$_BeerDetailsState(
      {required this.loading, required this.errorType, required this.beer});

  @override
  final bool loading;
  @override
  final ErrorType errorType;
  @override
  final Beer? beer;

  @override
  String toString() {
    return 'BeerDetailsState(loading: $loading, errorType: $errorType, beer: $beer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeerDetailsState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType) &&
            (identical(other.beer, beer) || other.beer == beer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, errorType, beer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeerDetailsStateCopyWith<_$_BeerDetailsState> get copyWith =>
      __$$_BeerDetailsStateCopyWithImpl<_$_BeerDetailsState>(this, _$identity);
}

abstract class _BeerDetailsState implements BeerDetailsState {
  const factory _BeerDetailsState(
      {required final bool loading,
      required final ErrorType errorType,
      required final Beer? beer}) = _$_BeerDetailsState;

  @override
  bool get loading;
  @override
  ErrorType get errorType;
  @override
  Beer? get beer;
  @override
  @JsonKey(ignore: true)
  _$$_BeerDetailsStateCopyWith<_$_BeerDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
