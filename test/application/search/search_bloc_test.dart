import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
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

      setUp(
        () {
          beersRepository = MockBeersRepository();
          searchBloc = SearchBloc(
            limit: beersLimit,
            beersRepository: beersRepository,
          );
        },
      );

      test('initialState should be initial', () {
        expect(searchBloc.state, equals(SearchState.initial()));
      });

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
            'state with added beers from repository',
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
    },
  );
}
