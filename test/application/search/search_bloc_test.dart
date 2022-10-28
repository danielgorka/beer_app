import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_favourite.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mock_values/beer.dart';
import '../../utils/mockables.dart';

void main() {
  group(
    'SearchBloc',
    () {
      const beersLimit = 2;
      final beers = [
        beer,
        beer,
      ];
      const query = 'query';

      late IBeersRepository beersRepository;
      late SearchBloc searchBloc;

      setUp(() {
        beersRepository = MockBeersRepository();
        searchBloc = SearchBloc(
          limit: beersLimit,
          beersRepository: beersRepository,
        );
      });

      test('initialState should be initial', () {
        expect(searchBloc.state, equals(SearchState.initial()));
      });

      blocTest<SearchBloc, SearchState>(
        'should add SearchEvent.refreshFavourite '
        'on favourites listener called',
        build: () => searchBloc,
        setUp: () {
          when(() => beersRepository.getFavouriteBeers()).thenAnswer(
            (_) => Future.value(Right([beer])),
          );
        },
        seed: () => SearchState(
          loading: false,
          isSubmitted: false,
          errorType: ErrorType.none,
          query: '',
          beers: [
            beer.copyWith(favourite: const BeerFavourite(false)),
            beer.copyWith(favourite: const BeerFavourite(false)),
          ],
          canLoadMore: true,
        ),
        act: (_) => searchBloc.favouriteBeersListener(),
        expect: () => [
          SearchState(
            loading: false,
            isSubmitted: false,
            errorType: ErrorType.none,
            query: '',
            beers: [
              beer.copyWith(favourite: const BeerFavourite(true)),
              beer.copyWith(favourite: const BeerFavourite(true)),
            ],
            canLoadMore: true,
          ),
        ],
      );

      group(
        'on<_Init>',
        () {
          blocTest<SearchBloc, SearchState>(
            'should emit SearchState.initial',
            build: () => searchBloc,
            act: (bloc) => bloc.add(const SearchEvent.init()),
            expect: () => [
              SearchState.initial(),
            ],
          );
        },
      );

      group(
        'on<_EditQuery>',
        () {
          blocTest<SearchBloc, SearchState>(
            'should emit state with isSubmitting = false',
            build: () => searchBloc,
            act: (bloc) => bloc.add(const SearchEvent.editQuery()),
            expect: () => [
              SearchState.initial().copyWith(
                isSubmitted: false,
              ),
            ],
          );
        },
      );

      group(
        'on<_QueryChanged>',
        () {
          blocTest<SearchBloc, SearchState>(
            'should emit state with new query',
            build: () => searchBloc,
            act: (bloc) => bloc.add(const SearchEvent.queryChanged(query)),
            expect: () => [
              SearchState.initial().copyWith(
                query: query,
              ),
            ],
          );
        },
      );

      group(
        'on<_Submitted>',
        () {
          Future<Either<BeersFailure, List<Beer>>> repositoryCall() =>
              beersRepository.getBeersByName(
                query: query,
                page: 1,
                perPage: beersLimit,
              );

          @isTest
          void shouldEmitError(
            String description, {
            required BeersFailure failure,
            required ErrorType errorType,
          }) {
            blocTest<SearchBloc, SearchState>(
              description,
              build: () => searchBloc,
              setUp: () {
                when(repositoryCall).thenAnswer(
                  (_) => Future.value(Left(failure)),
                );
              },
              act: (_) => searchBloc.add(const SearchEvent.submitted(query)),
              expect: () => [
                const SearchState(
                  loading: true,
                  isSubmitted: true,
                  errorType: ErrorType.none,
                  query: query,
                  beers: null,
                  canLoadMore: true,
                ),
                SearchState(
                  loading: false,
                  isSubmitted: true,
                  errorType: errorType,
                  query: query,
                  beers: null,
                  canLoadMore: true,
                ),
              ],
            );
          }

          blocTest<SearchBloc, SearchState>(
            'should emit state with loading and later '
            'state with beers from repository and canLoadMore = true '
            'when beers length is equal to limit',
            build: () => searchBloc,
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right(beers)),
              );
            },
            act: (_) => searchBloc.add(const SearchEvent.submitted(query)),
            expect: () => [
              const SearchState(
                loading: true,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: null,
                canLoadMore: true,
              ),
              SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: beers,
                canLoadMore: true,
              ),
            ],
          );

          blocTest<SearchBloc, SearchState>(
            'should emit state with loading and later '
            'state with beers from repository and canLoadMore = false '
            'when beers length is less than limit',
            build: () => searchBloc,
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right([beer])),
              );
            },
            act: (_) => searchBloc.add(const SearchEvent.submitted(query)),
            expect: () => [
              const SearchState(
                loading: true,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: null,
                canLoadMore: true,
              ),
              SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: [beer],
                canLoadMore: false,
              ),
            ],
          );

          shouldEmitError(
            'should emit initial state and later state with '
            'ErrorType.unknown when repository '
            'returns BeersFailure.notFound',
            failure: const BeersFailure.notFound(),
            errorType: ErrorType.unknown,
          );

          shouldEmitError(
            'should emit initial state and later state with '
            'ErrorType.network when repository '
            'returns BeersFailure.networkError',
            failure: const BeersFailure.networkError(),
            errorType: ErrorType.network,
          );

          shouldEmitError(
            'should emit initial state and later state with '
            'ErrorType.unknown when repository '
            'returns BeersFailure.unknownError',
            failure: const BeersFailure.unknownError(),
            errorType: ErrorType.unknown,
          );
        },
      );

      group(
        'on<_LoadMore>',
        () {
          final newBeers = List.generate(beersLimit, (index) => beer);
          final lastBeers = List.generate(beersLimit - 1, (index) => beer);

          Future<Either<BeersFailure, List<Beer>>> repositoryCall() =>
              beersRepository.getBeersByName(
                query: query,
                page: 2,
                perPage: beersLimit,
              );

          @isTest
          void shouldEmitError(
            String description, {
            required BeersFailure failure,
            required ErrorType errorType,
          }) {
            blocTest<SearchBloc, SearchState>(
              description,
              build: () => searchBloc,
              seed: () => SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: beers,
                canLoadMore: true,
              ),
              setUp: () {
                when(repositoryCall).thenAnswer(
                  (_) => Future.value(Left(failure)),
                );
              },
              act: (_) => searchBloc.add(const SearchEvent.loadMore()),
              expect: () => [
                SearchState(
                  loading: true,
                  isSubmitted: true,
                  errorType: ErrorType.none,
                  query: query,
                  beers: beers,
                  canLoadMore: true,
                ),
                SearchState(
                  loading: false,
                  isSubmitted: true,
                  errorType: errorType,
                  query: query,
                  beers: beers,
                  canLoadMore: true,
                ),
              ],
            );
          }

          blocTest<SearchBloc, SearchState>(
            'should emit no state when current state beers is null',
            build: () => searchBloc,
            seed: () => const SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.unknown,
              query: query,
              beers: null,
              canLoadMore: true,
            ),
            act: (_) => searchBloc.add(const SearchEvent.loadMore()),
            expect: () => <SearchState>[],
          );

          blocTest<SearchBloc, SearchState>(
            'should emit no state when current state is loading',
            build: () => searchBloc,
            seed: () => SearchState(
              loading: true,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => searchBloc.add(const SearchEvent.loadMore()),
            expect: () => <SearchState>[],
          );

          blocTest<SearchBloc, SearchState>(
            'should emit no state when current state canLoadMore is false',
            build: () => searchBloc,
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: false,
            ),
            act: (_) => searchBloc.add(const SearchEvent.loadMore()),
            expect: () => <SearchState>[],
          );

          blocTest<SearchBloc, SearchState>(
            'should emit state with loading and later '
            'state with added beers from repository',
            build: () => searchBloc,
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: true,
            ),
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right(newBeers)),
              );
            },
            act: (_) => searchBloc.add(const SearchEvent.loadMore()),
            expect: () => [
              SearchState(
                loading: true,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: beers,
                canLoadMore: true,
              ),
              SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: beers + newBeers,
                canLoadMore: true,
              ),
            ],
          );

          blocTest<SearchBloc, SearchState>(
            'should emit state with loading and later '
            'state with added beers and false canLoadMore '
            'when new beers length is less than limit',
            build: () => searchBloc,
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: true,
            ),
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right(lastBeers)),
              );
            },
            act: (_) => searchBloc.add(const SearchEvent.loadMore()),
            expect: () => [
              SearchState(
                loading: true,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: beers,
                canLoadMore: true,
              ),
              SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: beers + lastBeers,
                canLoadMore: false,
              ),
            ],
          );

          shouldEmitError(
            'should emit state with loading and later state with '
            'ErrorType.unknown when repository '
            'returns BeersFailure.notFound',
            failure: const BeersFailure.notFound(),
            errorType: ErrorType.unknown,
          );

          shouldEmitError(
            'should emit state with loading and later state with '
            'ErrorType.network when repository '
            'returns BeersFailure.networkError',
            failure: const BeersFailure.networkError(),
            errorType: ErrorType.network,
          );

          shouldEmitError(
            'should emit state with loading and later state with '
            'ErrorType.unknown when repository '
            'returns BeersFailure.unknownError',
            failure: const BeersFailure.unknownError(),
            errorType: ErrorType.unknown,
          );
        },
      );

      group(
        'on<_FavoriteChanged>',
        () {
          blocTest<SearchBloc, SearchState>(
            'should save beer in repository when favourite is true',
            build: () => searchBloc,
            setUp: () {
              when(() => beersRepository.saveFavouriteBeer(beer))
                  .thenAnswer((_) => Future.value());
            },
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => searchBloc.add(
              SearchEvent.favouriteChanged(
                beer: beer,
                favourite: true,
              ),
            ),
            expect: () => <SearchState>[],
            verify: (_) {
              verify(() => beersRepository.saveFavouriteBeer(beer)).called(1);
            },
          );

          blocTest<SearchBloc, SearchState>(
            'should remove beer from repository when favourite is false',
            build: () => searchBloc,
            setUp: () {
              when(() => beersRepository.removeFavouriteBeer(beer.id))
                  .thenAnswer((_) => Future.value());
            },
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => searchBloc.add(
              SearchEvent.favouriteChanged(
                beer: beer,
                favourite: false,
              ),
            ),
            expect: () => <SearchState>[],
            verify: (_) {
              verify(() => beersRepository.removeFavouriteBeer(beer.id))
                  .called(1);
            },
          );

          blocTest<SearchBloc, SearchState>(
            'should emit state with ErrorType.unknown '
            'when repository returns failure',
            build: () => searchBloc,
            setUp: () {
              when(
                () => beersRepository.removeFavouriteBeer(beer.id),
              ).thenAnswer(
                (_) => Future.value(const BeersFailure.unknownError()),
              );
            },
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => searchBloc.add(
              SearchEvent.favouriteChanged(
                beer: beer,
                favourite: false,
              ),
            ),
            expect: () => [
              SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.unknown,
                query: query,
                beers: beers,
                canLoadMore: true,
              ),
            ],
          );
        },
      );

      group(
        'on<_RefreshFavourite>',
        () {
          blocTest<SearchBloc, SearchState>(
            'should update beer favourite value from repository',
            build: () => searchBloc,
            setUp: () {
              when(() => beersRepository.getFavouriteBeers()).thenAnswer(
                (_) => Future.value(Right([beer])),
              );
            },
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers
                  .map(
                    (e) => e.copyWith(favourite: const BeerFavourite(false)),
                  )
                  .toList(),
              canLoadMore: true,
            ),
            act: (_) => searchBloc.add(
              const SearchEvent.refreshFavourite(),
            ),
            expect: () => [
              SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.none,
                query: query,
                beers: beers
                    .map(
                      (e) => e.copyWith(favourite: const BeerFavourite(true)),
                    )
                    .toList(),
                canLoadMore: true,
              ),
            ],
          );

          blocTest<SearchBloc, SearchState>(
            'should emit state with ErrorType.unknown '
            'when repository returns failure',
            build: () => searchBloc,
            setUp: () {
              when(() => beersRepository.getFavouriteBeers()).thenAnswer(
                (_) => Future.value(const Left(BeersFailure.unknownError())),
              );
            },
            seed: () => SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => searchBloc.add(
              const SearchEvent.refreshFavourite(),
            ),
            expect: () => [
              SearchState(
                loading: false,
                isSubmitted: true,
                errorType: ErrorType.unknown,
                query: query,
                beers: beers,
                canLoadMore: true,
              ),
            ],
          );
        },
      );
    },
  );
}
