part of 'beers_bloc.dart';

@freezed
class BeersEvent with _$BeersEvent {
  const factory BeersEvent.init() = _Init;

  const factory BeersEvent.loadMore() = _LoadMore;

  const factory BeersEvent.favouriteChanged({
    required Beer beer,
    required bool favourite,
  }) = _FavouriteChanged;

  const factory BeersEvent.refreshFavourite() = _RefreshFavourite;
}
