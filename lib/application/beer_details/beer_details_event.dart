part of 'beer_details_bloc.dart';

@freezed
class BeerDetailsEvent with _$BeerDetailsEvent {
  const factory BeerDetailsEvent.init({
    int? beerId,
    Beer? beer,
  }) = _Init;
}
