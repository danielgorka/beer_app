import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_state.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    @Named('BeersLimit') required this.limit,
    required this.beersRepository,
  }) : super(SearchState.initial()) {
    on<_Init>(_init);
    on<_EditQuery>(_editQuery);
    on<_QueryChanged>(_queryChanged);
    on<_Submitted>(_submitted);
    on<_LoadMore>(_loadMore);
  }

  final int limit;
  final IBeersRepository beersRepository;

  void _init(_Init event, Emitter<SearchState> emit) {
    emit(SearchState.initial());
  }

  void _editQuery(_EditQuery event, Emitter<SearchState> emit) {
    emit(
      state.copyWith(
        isSubmitted: false,
      ),
    );
  }

  void _queryChanged(
    _QueryChanged event,
    Emitter<SearchState> emit,
  ) {
    emit(
      state.copyWith(
        query: event.query,
      ),
    );
  }

  Future<void> _submitted(_Submitted event, Emitter<SearchState> emit) async {
    emit(
      state.copyWith(
        loading: true,
        isSubmitted: true,
        errorType: ErrorType.none,
        query: event.query,
      ),
    );

    final either = await beersRepository.getBeersByName(
      query: event.query,
      page: 1,
      perPage: limit,
    );

    emit(
      either.fold(
        _failureToState,
        (beers) => state.copyWith(
          loading: false,
          beers: beers,
          canLoadMore: beers.length == limit,
        ),
      ),
    );
  }

  Future<void> _loadMore(_LoadMore event, Emitter<SearchState> emit) async {
    if (state.beers == null || state.loading || !state.canLoadMore) {
      return;
    }

    emit(
      state.copyWith(
        loading: true,
        errorType: ErrorType.none,
      ),
    );

    final either = await beersRepository.getBeersByName(
      query: state.query,
      page: (state.beers!.length ~/ limit) + 1,
      perPage: limit,
    );

    emit(
      either.fold(
        _failureToState,
        (newBeers) => state.copyWith(
          loading: false,
          beers: [
            ...state.beers!,
            ...newBeers,
          ],
          canLoadMore: newBeers.length == limit,
        ),
      ),
    );
  }

  SearchState _failureToState(BeersFailure failure) {
    return failure.map(
      notFound: (_) => state.copyWith(
        loading: false,
        errorType: ErrorType.unknown,
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
}
