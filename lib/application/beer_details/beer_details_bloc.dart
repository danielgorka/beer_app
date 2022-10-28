import 'package:beer_app/core/either_ext.dart';
import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'beer_details_bloc.freezed.dart';
part 'beer_details_event.dart';
part 'beer_details_state.dart';

@injectable
class BeerDetailsBloc extends Bloc<BeerDetailsEvent, BeerDetailsState> {
  BeerDetailsBloc({
    required this.beersRepository,
  }) : super(BeerDetailsState.initial()) {
    on<_Init>(_init);
    on<_FavouriteChanged>(_favouriteChanged);
    on<_RefreshFavourite>(_refreshFavourite);

    beersRepository.addFavouriteBeersListener(favouriteBeersListener);
  }

  final IBeersRepository beersRepository;

  Future<void> _init(_Init event, Emitter<BeerDetailsState> emit) async {
    final Beer beer;
    if (event.beer == null) {
      emit(BeerDetailsState.initial());

      final beerId = BeerId(event.beerId!);
      final either = await beersRepository.getBeer(beerId);

      if (either.isLeft()) {
        emit(_failureToState(either.left));
        return;
      }

      beer = either.right;
    } else {
      beer = event.beer!;
    }

    emit(
      state.copyWith(
        loading: false,
        errorType: ErrorType.none,
        beer: beer,
      ),
    );
  }

  Future<void> _favouriteChanged(
    _FavouriteChanged event,
    Emitter<BeerDetailsState> emit,
  ) async {
    final BeersFailure? failure;

    if (event.favourite) {
      failure = await beersRepository.saveFavouriteBeer(state.beer!);
    } else {
      failure = await beersRepository.removeFavouriteBeer(state.beer!.id);
    }

    if (failure != null) {
      emit(_failureToState(failure));
    }
  }

  Future<void> _refreshFavourite(
    _RefreshFavourite event,
    Emitter<BeerDetailsState> emit,
  ) async {
    final either = await beersRepository.isFavouriteBeer(state.beer!.id);

    emit(
      either.fold(
        _failureToState,
        (favourite) => state.copyWith(
          beer: state.beer!.copyWith(favourite: favourite),
        ),
      ),
    );
  }

  @visibleForTesting
  void favouriteBeersListener() =>
      add(const BeerDetailsEvent.refreshFavourite());

  BeerDetailsState _failureToState(BeersFailure failure) {
    return failure.map(
      notFound: (_) => state.copyWith(
        loading: false,
        errorType: ErrorType.notFound,
      ),
      networkError: (_) => state.copyWith(
        loading: false,
        errorType: ErrorType.network,
      ),
      unknownError: (_) => state.copyWith(
        loading: false,
        errorType: ErrorType.unknown,
      ),
    );
  }

  @override
  Future<void> close() {
    beersRepository.removeFavouriteBeersListener(favouriteBeersListener);
    return super.close();
  }
}
