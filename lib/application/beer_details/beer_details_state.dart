part of 'beer_details_bloc.dart';

enum ErrorType {
  none,
  notFound,
  network,
  unknown,
}

@freezed
class BeerDetailsState with _$BeerDetailsState {
  const factory BeerDetailsState({
    required bool loading,
    required ErrorType errorType,
    required Beer? beer,
  }) = _BeerDetailsState;

  factory BeerDetailsState.initial() => const BeerDetailsState(
        loading: true,
        errorType: ErrorType.none,
        beer: null,
      );
}
