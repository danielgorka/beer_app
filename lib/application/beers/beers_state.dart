part of 'beers_bloc.dart';

enum ErrorType {
  none,
  network,
  unknown,
}

@freezed
class BeersState with _$BeersState {
  const factory BeersState({
    required bool loading,
    required ErrorType errorType,
    required List<Beer>? beers,
    required bool canLoadMore,
  }) = _BeersState;

  factory BeersState.initial() => const BeersState(
        loading: false,
        errorType: ErrorType.none,
        beers: null,
        canLoadMore: true,
      );
}
