import 'package:beer_app/application/beers/beers_bloc.dart';
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
    'BeersBloc',
    () {
      const beersLimit = 2;
      final beers = [
        beer,
        beer,
      ];

      late IBeersRepository beersRepository;
      late BeersBloc beersBloc;

      setUp(() {
        beersRepository = MockBeersRepository();
        beersBloc = BeersBloc(
          limit: beersLimit,
          beersRepository: beersRepository,
        );
      });

      test('initialState should be initial', () {
        expect(beersBloc.state, equals(BeersState.initial()));
      });

      blocTest<BeersBloc, BeersState>(
        'should add BeerDetailsEvent.refreshFavourite '
        'on favourites listener called',
        build: () => beersBloc,
        setUp: () {
          when(() => beersRepository.getFavouriteBeers()).thenAnswer(
            (_) => Future.value(Right([beer])),
          );
        },
        seed: () => BeersState(
          loading: false,
          errorType: ErrorType.none,
          beers: [
            beer.copyWith(favourite: const BeerFavourite(false)),
            beer.copyWith(favourite: const BeerFavourite(false)),
          ],
          canLoadMore: true,
        ),
        act: (_) => beersBloc.favouriteBeersListener(),
        expect: () => [
          BeersState(
            loading: false,
            errorType: ErrorType.none,
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
          Future<Either<BeersFailure, List<Beer>>> repositoryCall() =>
              beersRepository.getBeers(
                page: 1,
                perPage: beersLimit,
              );

          @isTest
          void shouldEmitError(
            String description, {
            required BeersFailure failure,
            required ErrorType errorType,
          }) {
            blocTest<BeersBloc, BeersState>(
              description,
              build: () => beersBloc,
              setUp: () {
                when(repositoryCall).thenAnswer(
                  (_) => Future.value(Left(failure)),
                );
              },
              act: (_) => beersBloc.add(const BeersEvent.init()),
              expect: () => [
                BeersState.initial(),
                BeersState(
                  loading: false,
                  errorType: errorType,
                  beers: null,
                  canLoadMore: true,
                ),
              ],
            );
          }

          blocTest<BeersBloc, BeersState>(
            'should emit state with loading and later '
            'state with beers from repository and canLoadMore = true '
            'when beers length is equal to limit',
            build: () => beersBloc,
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right(beers)),
              );
            },
            act: (_) => beersBloc.add(const BeersEvent.init()),
            expect: () => [
              BeersState.initial(),
              BeersState(
                loading: false,
                errorType: ErrorType.none,
                beers: beers,
                canLoadMore: true,
              ),
            ],
          );

          blocTest<BeersBloc, BeersState>(
            'should emit state with loading and later '
            'state with beers from repository and canLoadMore = false '
            'when beers length is less than limit',
            build: () => beersBloc,
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right([beer])),
              );
            },
            act: (_) => beersBloc.add(const BeersEvent.init()),
            expect: () => [
              BeersState.initial(),
              BeersState(
                loading: false,
                errorType: ErrorType.none,
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
              beersRepository.getBeers(
                page: 2,
                perPage: beersLimit,
              );

          @isTest
          void shouldEmitError(
            String description, {
            required BeersFailure failure,
            required ErrorType errorType,
          }) {
            blocTest<BeersBloc, BeersState>(
              description,
              build: () => beersBloc,
              seed: () => BeersState(
                loading: false,
                errorType: ErrorType.none,
                beers: beers,
                canLoadMore: true,
              ),
              setUp: () {
                when(repositoryCall).thenAnswer(
                  (_) => Future.value(Left(failure)),
                );
              },
              act: (_) => beersBloc.add(const BeersEvent.loadMore()),
              expect: () => [
                BeersState(
                  loading: true,
                  errorType: ErrorType.none,
                  beers: beers,
                  canLoadMore: true,
                ),
                BeersState(
                  loading: false,
                  errorType: errorType,
                  beers: beers,
                  canLoadMore: true,
                ),
              ],
            );
          }

          blocTest<BeersBloc, BeersState>(
            'should emit no state when current state beers is null',
            build: () => beersBloc,
            seed: () => const BeersState(
              loading: false,
              errorType: ErrorType.unknown,
              beers: null,
              canLoadMore: true,
            ),
            act: (_) => beersBloc.add(const BeersEvent.loadMore()),
            expect: () => <BeersState>[],
          );

          blocTest<BeersBloc, BeersState>(
            'should emit no state when current state is loading',
            build: () => beersBloc,
            seed: () => BeersState(
              loading: true,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => beersBloc.add(const BeersEvent.loadMore()),
            expect: () => <BeersState>[],
          );

          blocTest<BeersBloc, BeersState>(
            'should emit no state when current state canLoadMore is false',
            build: () => beersBloc,
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: false,
            ),
            act: (_) => beersBloc.add(const BeersEvent.loadMore()),
            expect: () => <BeersState>[],
          );

          blocTest<BeersBloc, BeersState>(
            'should emit state with loading and later '
            'state with added beers from repository',
            build: () => beersBloc,
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: true,
            ),
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right(newBeers)),
              );
            },
            act: (_) => beersBloc.add(const BeersEvent.loadMore()),
            expect: () => [
              BeersState(
                loading: true,
                errorType: ErrorType.none,
                beers: beers,
                canLoadMore: true,
              ),
              BeersState(
                loading: false,
                errorType: ErrorType.none,
                beers: beers + newBeers,
                canLoadMore: true,
              ),
            ],
          );

          blocTest<BeersBloc, BeersState>(
            'should emit state with loading and later '
            'state with added beers and false canLoadMore '
            'when new beers length is less than limit',
            build: () => beersBloc,
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: true,
            ),
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right(lastBeers)),
              );
            },
            act: (_) => beersBloc.add(const BeersEvent.loadMore()),
            expect: () => [
              BeersState(
                loading: true,
                errorType: ErrorType.none,
                beers: beers,
                canLoadMore: true,
              ),
              BeersState(
                loading: false,
                errorType: ErrorType.none,
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
          blocTest<BeersBloc, BeersState>(
            'should save beer in repository when favourite is true',
            build: () => beersBloc,
            setUp: () {
              when(() => beersRepository.saveFavouriteBeer(beer))
                  .thenAnswer((_) => Future.value());
            },
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => beersBloc.add(
              BeersEvent.favouriteChanged(
                beer: beer,
                favourite: true,
              ),
            ),
            expect: () => <BeersState>[],
            verify: (_) {
              verify(() => beersRepository.saveFavouriteBeer(beer)).called(1);
            },
          );

          blocTest<BeersBloc, BeersState>(
            'should remove beer from repository when favourite is false',
            build: () => beersBloc,
            setUp: () {
              when(() => beersRepository.removeFavouriteBeer(beer.id))
                  .thenAnswer((_) => Future.value());
            },
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => beersBloc.add(
              BeersEvent.favouriteChanged(
                beer: beer,
                favourite: false,
              ),
            ),
            expect: () => <BeersState>[],
            verify: (_) {
              verify(() => beersRepository.removeFavouriteBeer(beer.id))
                  .called(1);
            },
          );

          blocTest<BeersBloc, BeersState>(
            'should emit state with ErrorType.unknown '
            'when repository returns failure',
            build: () => beersBloc,
            setUp: () {
              when(
                () => beersRepository.removeFavouriteBeer(beer.id),
              ).thenAnswer(
                (_) => Future.value(const BeersFailure.unknownError()),
              );
            },
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => beersBloc.add(
              BeersEvent.favouriteChanged(
                beer: beer,
                favourite: false,
              ),
            ),
            expect: () => [
              BeersState(
                loading: false,
                errorType: ErrorType.unknown,
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
          blocTest<BeersBloc, BeersState>(
            'should update beer favourite value from repository',
            build: () => beersBloc,
            setUp: () {
              when(() => beersRepository.getFavouriteBeers()).thenAnswer(
                (_) => Future.value(Right([beer])),
              );
            },
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers
                  .map(
                    (e) => e.copyWith(favourite: const BeerFavourite(false)),
                  )
                  .toList(),
              canLoadMore: true,
            ),
            act: (_) => beersBloc.add(
              const BeersEvent.refreshFavourite(),
            ),
            expect: () => [
              BeersState(
                loading: false,
                errorType: ErrorType.none,
                beers: beers
                    .map(
                      (e) => e.copyWith(favourite: const BeerFavourite(true)),
                    )
                    .toList(),
                canLoadMore: true,
              ),
            ],
          );

          blocTest<BeersBloc, BeersState>(
            'should emit state with ErrorType.unknown '
            'when repository returns failure',
            build: () => beersBloc,
            setUp: () {
              when(() => beersRepository.getFavouriteBeers()).thenAnswer(
                (_) => Future.value(const Left(BeersFailure.unknownError())),
              );
            },
            seed: () => BeersState(
              loading: false,
              errorType: ErrorType.none,
              beers: beers,
              canLoadMore: true,
            ),
            act: (_) => beersBloc.add(
              const BeersEvent.refreshFavourite(),
            ),
            expect: () => [
              BeersState(
                loading: false,
                errorType: ErrorType.unknown,
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
