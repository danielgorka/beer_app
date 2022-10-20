part of 'beers_bloc.dart';

@freezed
class BeersEvent with _$BeersEvent {
  const factory BeersEvent.init() = _Init;
  const factory BeersEvent.loadMore() = _LoadMore;
}
