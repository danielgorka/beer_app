part of 'favourites_bloc.dart';

@freezed
class FavouritesState with _$FavouritesState {
  const factory FavouritesState({
    required bool loading,
    required bool hasError,
    required List<Beer>? beers,
  }) = _FavouritesState;

  factory FavouritesState.initial() => const FavouritesState(
        loading: false,
        hasError: false,
        beers: null,
      );
}
