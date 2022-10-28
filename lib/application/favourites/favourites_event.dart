part of 'favourites_bloc.dart';

@freezed
class FavouritesEvent with _$FavouritesEvent {
  const factory FavouritesEvent.init() = _Init;
  const factory FavouritesEvent.favouriteChanged({
    required Beer beer,
    required bool favourite,
  }) = _FavoriteChanged;
}
