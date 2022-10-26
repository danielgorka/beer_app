part of 'search_bloc.dart';

enum ErrorType {
  none,
  network,
  unknown,
}

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required bool loading,
    required bool isSubmitted,
    required ErrorType errorType,
    required String query,
    required List<Beer>? beers,
    required bool canLoadMore,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        loading: false,
        isSubmitted: false,
        errorType: ErrorType.none,
        query: '',
        beers: null,
        canLoadMore: true,
      );
}
