// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'beers_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BeersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadMore,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
    required TResult Function() refreshFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadMore,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
    TResult? Function()? refreshFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadMore,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    TResult Function()? refreshFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FavouriteChanged value) favouriteChanged,
    required TResult Function(_RefreshFavourite value) refreshFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FavouriteChanged value)? favouriteChanged,
    TResult? Function(_RefreshFavourite value)? refreshFavourite,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FavouriteChanged value)? favouriteChanged,
    TResult Function(_RefreshFavourite value)? refreshFavourite,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeersEventCopyWith<$Res> {
  factory $BeersEventCopyWith(
          BeersEvent value, $Res Function(BeersEvent) then) =
      _$BeersEventCopyWithImpl<$Res, BeersEvent>;
}

/// @nodoc
class _$BeersEventCopyWithImpl<$Res, $Val extends BeersEvent>
    implements $BeersEventCopyWith<$Res> {
  _$BeersEventCopyWithImpl(this._value, this._then);

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
    extends _$BeersEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'BeersEvent.init()';
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
    required TResult Function() loadMore,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
    required TResult Function() refreshFavourite,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadMore,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
    TResult? Function()? refreshFavourite,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadMore,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    TResult Function()? refreshFavourite,
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
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FavouriteChanged value) favouriteChanged,
    required TResult Function(_RefreshFavourite value) refreshFavourite,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FavouriteChanged value)? favouriteChanged,
    TResult? Function(_RefreshFavourite value)? refreshFavourite,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FavouriteChanged value)? favouriteChanged,
    TResult Function(_RefreshFavourite value)? refreshFavourite,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements BeersEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_LoadMoreCopyWith<$Res> {
  factory _$$_LoadMoreCopyWith(
          _$_LoadMore value, $Res Function(_$_LoadMore) then) =
      __$$_LoadMoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadMoreCopyWithImpl<$Res>
    extends _$BeersEventCopyWithImpl<$Res, _$_LoadMore>
    implements _$$_LoadMoreCopyWith<$Res> {
  __$$_LoadMoreCopyWithImpl(
      _$_LoadMore _value, $Res Function(_$_LoadMore) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadMore implements _LoadMore {
  const _$_LoadMore();

  @override
  String toString() {
    return 'BeersEvent.loadMore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadMore,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
    required TResult Function() refreshFavourite,
  }) {
    return loadMore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadMore,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
    TResult? Function()? refreshFavourite,
  }) {
    return loadMore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadMore,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    TResult Function()? refreshFavourite,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FavouriteChanged value) favouriteChanged,
    required TResult Function(_RefreshFavourite value) refreshFavourite,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FavouriteChanged value)? favouriteChanged,
    TResult? Function(_RefreshFavourite value)? refreshFavourite,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FavouriteChanged value)? favouriteChanged,
    TResult Function(_RefreshFavourite value)? refreshFavourite,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements BeersEvent {
  const factory _LoadMore() = _$_LoadMore;
}

/// @nodoc
abstract class _$$_FavouriteChangedCopyWith<$Res> {
  factory _$$_FavouriteChangedCopyWith(
          _$_FavouriteChanged value, $Res Function(_$_FavouriteChanged) then) =
      __$$_FavouriteChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({Beer beer, bool favourite});

  $BeerCopyWith<$Res> get beer;
}

/// @nodoc
class __$$_FavouriteChangedCopyWithImpl<$Res>
    extends _$BeersEventCopyWithImpl<$Res, _$_FavouriteChanged>
    implements _$$_FavouriteChangedCopyWith<$Res> {
  __$$_FavouriteChangedCopyWithImpl(
      _$_FavouriteChanged _value, $Res Function(_$_FavouriteChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? beer = null,
    Object? favourite = null,
  }) {
    return _then(_$_FavouriteChanged(
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

class _$_FavouriteChanged implements _FavouriteChanged {
  const _$_FavouriteChanged({required this.beer, required this.favourite});

  @override
  final Beer beer;
  @override
  final bool favourite;

  @override
  String toString() {
    return 'BeersEvent.favouriteChanged(beer: $beer, favourite: $favourite)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouriteChanged &&
            (identical(other.beer, beer) || other.beer == beer) &&
            (identical(other.favourite, favourite) ||
                other.favourite == favourite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, beer, favourite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouriteChangedCopyWith<_$_FavouriteChanged> get copyWith =>
      __$$_FavouriteChangedCopyWithImpl<_$_FavouriteChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadMore,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
    required TResult Function() refreshFavourite,
  }) {
    return favouriteChanged(beer, favourite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadMore,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
    TResult? Function()? refreshFavourite,
  }) {
    return favouriteChanged?.call(beer, favourite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadMore,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    TResult Function()? refreshFavourite,
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
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FavouriteChanged value) favouriteChanged,
    required TResult Function(_RefreshFavourite value) refreshFavourite,
  }) {
    return favouriteChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FavouriteChanged value)? favouriteChanged,
    TResult? Function(_RefreshFavourite value)? refreshFavourite,
  }) {
    return favouriteChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FavouriteChanged value)? favouriteChanged,
    TResult Function(_RefreshFavourite value)? refreshFavourite,
    required TResult orElse(),
  }) {
    if (favouriteChanged != null) {
      return favouriteChanged(this);
    }
    return orElse();
  }
}

abstract class _FavouriteChanged implements BeersEvent {
  const factory _FavouriteChanged(
      {required final Beer beer,
      required final bool favourite}) = _$_FavouriteChanged;

  Beer get beer;
  bool get favourite;
  @JsonKey(ignore: true)
  _$$_FavouriteChangedCopyWith<_$_FavouriteChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RefreshFavouriteCopyWith<$Res> {
  factory _$$_RefreshFavouriteCopyWith(
          _$_RefreshFavourite value, $Res Function(_$_RefreshFavourite) then) =
      __$$_RefreshFavouriteCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RefreshFavouriteCopyWithImpl<$Res>
    extends _$BeersEventCopyWithImpl<$Res, _$_RefreshFavourite>
    implements _$$_RefreshFavouriteCopyWith<$Res> {
  __$$_RefreshFavouriteCopyWithImpl(
      _$_RefreshFavourite _value, $Res Function(_$_RefreshFavourite) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RefreshFavourite implements _RefreshFavourite {
  const _$_RefreshFavourite();

  @override
  String toString() {
    return 'BeersEvent.refreshFavourite()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RefreshFavourite);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() loadMore,
    required TResult Function(Beer beer, bool favourite) favouriteChanged,
    required TResult Function() refreshFavourite,
  }) {
    return refreshFavourite();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function()? loadMore,
    TResult? Function(Beer beer, bool favourite)? favouriteChanged,
    TResult? Function()? refreshFavourite,
  }) {
    return refreshFavourite?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? loadMore,
    TResult Function(Beer beer, bool favourite)? favouriteChanged,
    TResult Function()? refreshFavourite,
    required TResult orElse(),
  }) {
    if (refreshFavourite != null) {
      return refreshFavourite();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_FavouriteChanged value) favouriteChanged,
    required TResult Function(_RefreshFavourite value) refreshFavourite,
  }) {
    return refreshFavourite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_FavouriteChanged value)? favouriteChanged,
    TResult? Function(_RefreshFavourite value)? refreshFavourite,
  }) {
    return refreshFavourite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_FavouriteChanged value)? favouriteChanged,
    TResult Function(_RefreshFavourite value)? refreshFavourite,
    required TResult orElse(),
  }) {
    if (refreshFavourite != null) {
      return refreshFavourite(this);
    }
    return orElse();
  }
}

abstract class _RefreshFavourite implements BeersEvent {
  const factory _RefreshFavourite() = _$_RefreshFavourite;
}

/// @nodoc
mixin _$BeersState {
  bool get loading => throw _privateConstructorUsedError;
  ErrorType get errorType => throw _privateConstructorUsedError;
  List<Beer>? get beers => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BeersStateCopyWith<BeersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeersStateCopyWith<$Res> {
  factory $BeersStateCopyWith(
          BeersState value, $Res Function(BeersState) then) =
      _$BeersStateCopyWithImpl<$Res, BeersState>;
  @useResult
  $Res call(
      {bool loading, ErrorType errorType, List<Beer>? beers, bool canLoadMore});
}

/// @nodoc
class _$BeersStateCopyWithImpl<$Res, $Val extends BeersState>
    implements $BeersStateCopyWith<$Res> {
  _$BeersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorType = null,
    Object? beers = freezed,
    Object? canLoadMore = null,
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
      beers: freezed == beers
          ? _value.beers
          : beers // ignore: cast_nullable_to_non_nullable
              as List<Beer>?,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeersStateCopyWith<$Res>
    implements $BeersStateCopyWith<$Res> {
  factory _$$_BeersStateCopyWith(
          _$_BeersState value, $Res Function(_$_BeersState) then) =
      __$$_BeersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading, ErrorType errorType, List<Beer>? beers, bool canLoadMore});
}

/// @nodoc
class __$$_BeersStateCopyWithImpl<$Res>
    extends _$BeersStateCopyWithImpl<$Res, _$_BeersState>
    implements _$$_BeersStateCopyWith<$Res> {
  __$$_BeersStateCopyWithImpl(
      _$_BeersState _value, $Res Function(_$_BeersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? errorType = null,
    Object? beers = freezed,
    Object? canLoadMore = null,
  }) {
    return _then(_$_BeersState(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorType: null == errorType
          ? _value.errorType
          : errorType // ignore: cast_nullable_to_non_nullable
              as ErrorType,
      beers: freezed == beers
          ? _value._beers
          : beers // ignore: cast_nullable_to_non_nullable
              as List<Beer>?,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BeersState implements _BeersState {
  const _$_BeersState(
      {required this.loading,
      required this.errorType,
      required final List<Beer>? beers,
      required this.canLoadMore})
      : _beers = beers;

  @override
  final bool loading;
  @override
  final ErrorType errorType;
  final List<Beer>? _beers;
  @override
  List<Beer>? get beers {
    final value = _beers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool canLoadMore;

  @override
  String toString() {
    return 'BeersState(loading: $loading, errorType: $errorType, beers: $beers, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeersState &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.errorType, errorType) ||
                other.errorType == errorType) &&
            const DeepCollectionEquality().equals(other._beers, _beers) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, errorType,
      const DeepCollectionEquality().hash(_beers), canLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeersStateCopyWith<_$_BeersState> get copyWith =>
      __$$_BeersStateCopyWithImpl<_$_BeersState>(this, _$identity);
}

abstract class _BeersState implements BeersState {
  const factory _BeersState(
      {required final bool loading,
      required final ErrorType errorType,
      required final List<Beer>? beers,
      required final bool canLoadMore}) = _$_BeersState;

  @override
  bool get loading;
  @override
  ErrorType get errorType;
  @override
  List<Beer>? get beers;
  @override
  bool get canLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$_BeersStateCopyWith<_$_BeersState> get copyWith =>
      throw _privateConstructorUsedError;
}
