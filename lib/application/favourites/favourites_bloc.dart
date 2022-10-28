import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favourites_bloc.freezed.dart';
part 'favourites_event.dart';
part 'favourites_state.dart';

@injectable
class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc({
    required this.beersRepository,
  }) : super(FavouritesState.initial()) {
    on<_Init>(_init);
    on<_FavoriteChanged>(_favoriteChanged);

    beersRepository.addFavouriteBeersListener(favouriteBeersListener);
  }

  final IBeersRepository beersRepository;

  Future<void> _init(_Init event, Emitter<FavouritesState> emit) async {
    emit(FavouritesState.initial());

    final either = await beersRepository.getFavouriteBeers();

    emit(
      either.fold(
        (_) => state.copyWith(
          loading: false,
          hasError: true,
        ),
        (beers) => state.copyWith(
          loading: false,
          beers: beers,
        ),
      ),
    );
  }

  Future<void> _favoriteChanged(
    _FavoriteChanged event,
    Emitter<FavouritesState> emit,
  ) async {
    final BeersFailure? failure;

    if (event.favourite) {
      failure = await beersRepository.saveFavouriteBeer(event.beer);
    } else {
      failure = await beersRepository.removeFavouriteBeer(event.beer.id);
    }

    if (failure != null) {
      emit(
        state.copyWith(
          loading: false,
          hasError: true,
          beers: null,
        ),
      );
    }
  }

  @visibleForTesting
  void favouriteBeersListener() => add(const FavouritesEvent.init());

  @override
  Future<void> close() {
    beersRepository.removeFavouriteBeersListener(favouriteBeersListener);
    return super.close();
  }
}
