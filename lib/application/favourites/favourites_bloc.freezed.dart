// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favourites_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavouritesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FavoriteChanged value) favouriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FavoriteChanged value)? favouriteChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FavoriteChanged value)? favouriteChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesEventCopyWith<$Res> {
  factory $FavouritesEventCopyWith(
          FavouritesEvent value, $Res Function(FavouritesEvent) then) =
      _$FavouritesEventCopyWithImpl<$Res, FavouritesEvent>;
}

/// @nodoc
class _$FavouritesEventCopyWithImpl<$Res, $Val extends FavouritesEvent>
    implements $FavouritesEventCopyWith<$Res> {
  _$FavouritesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'FavouritesEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FavoriteChanged value) favouriteChanged,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FavoriteChanged value)? favouriteChanged,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FavoriteChanged value)? favouriteChanged,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements FavouritesEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_FavoriteChangedCopyWith<$Res> {
  factory _$$_FavoriteChangedCopyWith(
          _$_FavoriteChanged value, $Res Function(_$_FavoriteChanged) then) =
      __$$_FavoriteChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({Beer beer, bool favourite});

  $BeerCopyWith<$Res> get beer;
}

/// @nodoc
class __$$_FavoriteChangedCopyWithImpl<$Res>
    extends _$FavouritesEventCopyWithImpl<$Res, _$_FavoriteChanged>
    implements _$$_FavoriteChangedCopyWith<$Res> {
  __$$_FavoriteChangedCopyWithImpl(
      _$_FavoriteChanged _value, $Res Function(_$_FavoriteChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beer = null,
    Object? favourite = null,
  }) {
    return _then(_$_FavoriteChanged(
      beer: null == beer
          ? _value.beer
          : beer // ignore: cast_nullable_to_non_nullable
              as Beer,
      favourite: null == favourite
          ? _value.favourite
          : favourite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BeerCopyWith<$Res> get beer {
    return $BeerCopyWith<$Res>(_value.beer, (value) {
      return _then(_value.copyWith(beer: value));
    });
  }
}

/// @nodoc

class _$_FavoriteChanged implements _FavoriteChanged {
  const _$_FavoriteChanged({required this.beer, required this.favourite});

  @override
  final Beer beer;
  @override
  final bool favourite;

  @override
  String toString() {
    return 'FavouritesEvent.favouriteChanged(beer: $beer, favourite: $favourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavoriteChanged &&
            (identical(other.beer, beer) || other.beer == beer) &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beer, favourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavoriteChangedCopyWith<_$_FavoriteChanged> get copyWith =>
      __$$_FavoriteChangedCopyWithImpl<_$_FavoriteChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
  }) {
    return favouriteChanged(beer, favourite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
  }) {
    return favouriteChanged?.call(beer, favourite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    required TResult orElse(),
  }) {
    if (favouriteChanged != null) {
      return favouriteChanged(beer, favourite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_FavoriteChanged value) favouriteChanged,
  }) {
    return favouriteChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_FavoriteChanged value)? favouriteChanged,
  }) {
    return favouriteChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_FavoriteChanged value)? favouriteChanged,
    required TResult orElse(),
  }) {
    if (favouriteChanged != null) {
      return favouriteChanged(this);
    }
    return orElse();
  }
}

abstract class _FavoriteChanged implements FavouritesEvent {
  const factory _FavoriteChanged(
      {required final Beer beer,
      required final bool favourite}) = _$_FavoriteChanged;

  Beer get beer;
  bool get favourite;
  @JsonKey(ignore: true)
  _$$_FavoriteChangedCopyWith<_$_FavoriteChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FavouritesState {
  bool get loading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  List<Beer>? get beers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouritesStateCopyWith<FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesStateCopyWith<$Res> {
  factory $FavouritesStateCopyWith(
          FavouritesState value, $Res Function(FavouritesState) then) =
      _$FavouritesStateCopyWithImpl<$Res, FavouritesState>;
  @useResult
  $Res call({bool loading, bool hasError, List<Beer>? beers});
}

/// @nodoc
class _$FavouritesStateCopyWithImpl<$Res, $Val extends FavouritesState>
    implements $FavouritesStateCopyWith<$Res> {
  _$FavouritesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hasError = null,
    Object? beers = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      beers: freezed == beers
          ? _value.beers
          : beers // ignore: cast_nullable_to_non_nullable
              as List<Beer>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouritesStateCopyWith<$Res>
    implements $FavouritesStateCopyWith<$Res> {
  factory _$$_FavouritesStateCopyWith(
          _$_FavouritesState value, $Res Function(_$_FavouritesState) then) =
      __$$_FavouritesStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool hasError, List<Beer>? beers});
}

/// @nodoc
class __$$_FavouritesStateCopyWithImpl<$Res>
    extends _$FavouritesStateCopyWithImpl<$Res, _$_FavouritesState>
    implements _$$_FavouritesStateCopyWith<$Res> {
  __$$_FavouritesStateCopyWithImpl(
      _$_FavouritesState _value, $Res Function(_$_FavouritesState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? hasError = null,
    Object? beers = freezed,
  }) {
    return _then(_$_FavouritesState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      beers: freezed == beers
          ? _value._beers
          : beers // ignore: cast_nullable_to_non_nullable
              as List<Beer>?,
    ));
  }
}

/// @nodoc

class _$_FavouritesState implements _FavouritesState {
  const _$_FavouritesState(
      {required this.loading,
      required this.hasError,
      required final List<Beer>? beers})
      : _beers = beers;

  @override
  final bool loading;
  @override
  final bool hasError;
  final List<Beer>? _beers;
  @override
  List<Beer>? get beers {
    final value = _beers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FavouritesState(loading: $loading, hasError: $hasError, beers: $beers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouritesState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            const DeepCollectionEquality().equals(other._beers, _beers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, hasError,
      const DeepCollectionEquality().hash(_beers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouritesStateCopyWith<_$_FavouritesState> get copyWith =>
      __$$_FavouritesStateCopyWithImpl<_$_FavouritesState>(this, _$identity);
}

abstract class _FavouritesState implements FavouritesState {
  const factory _FavouritesState(
      {required final bool loading,
      required final bool hasError,
      required final List<Beer>? beers}) = _$_FavouritesState;

  @override
  bool get loading;
  @override
  bool get hasError;
  @override
  List<Beer>? get beers;
  @override
  @JsonKey(ignore: true)
  _$$_FavouritesStateCopyWith<_$_FavouritesState> get copyWith =>
      throw _privateConstructorUsedError;
}
