part of 'search_bloc.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.init() = _Init;
  const factory SearchEvent.editQuery() = _EditQuery;
  const factory SearchEvent.queryChanged(String query) = _QueryChanged;
  const factory SearchEvent.submitted(String query) = _Submitted;
  const factory SearchEvent.loadMore() = _LoadMore;
  const factory SearchEvent.favouriteChanged({
    required Beer beer,
    required bool favourite,
  }) = _FavouriteChanged;
  const factory SearchEvent.refreshFavourite() = _RefreshFavourite;
}
