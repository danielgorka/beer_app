import 'package:beer_app/application/beer_details/beer_details_bloc.dart';
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
    'BeerDetailsBloc',
    () {
      late IBeersRepository beersRepository;
      late BeerDetailsBloc beerDetailsBloc;

      setUp(() {
        beersRepository = MockBeersRepository();
        beerDetailsBloc = BeerDetailsBloc(
          beersRepository: beersRepository,
        );
      });

      test('initialState should be initial', () {
        expect(beerDetailsBloc.state, equals(BeerDetailsState.initial()));
      });

      blocTest<BeerDetailsBloc, BeerDetailsState>(
        'should add BeerDetailsEvent.refreshFavourite '
        'on favourites listener called',
        build: () => beerDetailsBloc,
        setUp: () {
          when(() => beersRepository.isFavouriteBeer(beerId)).thenAnswer(
            (_) => Future.value(const Right(BeerFavourite(true))),
          );
        },
        seed: () => BeerDetailsState(
          loading: false,
          errorType: ErrorType.none,
          beer: beer.copyWith(favourite: const BeerFavourite(false)),
        ),
        act: (_) => beerDetailsBloc.favouriteBeersListener(),
        expect: () => [
          BeerDetailsState(
            loading: false,
            errorType: ErrorType.none,
            beer: beer.copyWith(favourite: const BeerFavourite(true)),
          ),
        ],
      );

      group(
        'on<_Init>',
        () {
          Future<Either<BeersFailure, Beer>> repositoryCall() =>
              beersRepository.getBeer(beerId);

          setUp(() {
            when(repositoryCall).thenAnswer(
              (_) => Future.value(Right(beer)),
            );
          });

          @isTest
          void shouldEmitError(
            String description, {
            required BeersFailure failure,
            required ErrorType errorType,
          }) {
            blocTest<BeerDetailsBloc, BeerDetailsState>(
              description,
              build: () => beerDetailsBloc,
              setUp: () {
                when(repositoryCall).thenAnswer(
                  (_) => Future.value(Left(failure)),
                );
              },
              act: (_) => beerDetailsBloc
                  .add(BeerDetailsEvent.init(beerId: beerId.value)),
              expect: () => [
                BeerDetailsState.initial(),
                BeerDetailsState(
                  loading: false,
                  errorType: errorType,
                  beer: null,
                ),
              ],
            );
          }

          blocTest<BeerDetailsBloc, BeerDetailsState>(
            'should emit state with loading and '
            'later state with beer from repository',
            build: () => beerDetailsBloc,
            act: (_) => beerDetailsBloc
                .add(BeerDetailsEvent.init(beerId: beerId.value)),
            expect: () => [
              BeerDetailsState.initial(),
              BeerDetailsState(
                loading: false,
                errorType: ErrorType.none,
                beer: beer,
              ),
            ],
            verify: (_) {
              verify(repositoryCall).called(1);
            },
          );

          blocTest<BeerDetailsBloc, BeerDetailsState>(
            'should emit state with beer from event when it is not null',
            build: () => beerDetailsBloc,
            act: (_) => beerDetailsBloc.add(BeerDetailsEvent.init(beer: beer)),
            expect: () => [
              BeerDetailsState(
                loading: false,
                errorType: ErrorType.none,
                beer: beer,
              ),
            ],
            verify: (_) {
              verifyNever(repositoryCall);
            },
          );

          shouldEmitError(
            'should emit initial state and later state with '
            'ErrorType.notFound when repository '
            'returns BeersFailure.notFound',
            failure: const BeersFailure.notFound(),
            errorType: ErrorType.notFound,
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
        'on<_FavoriteChanged>',
        () {
          blocTest<BeerDetailsBloc, BeerDetailsState>(
            'should save beer in repository when favourite is true',
            build: () => beerDetailsBloc,
            setUp: () {
              when(() => beersRepository.saveFavouriteBeer(beer))
                  .thenAnswer((_) => Future.value());
            },
            seed: () => BeerDetailsState(
              loading: false,
              errorType: ErrorType.none,
              beer: beer,
            ),
            act: (_) => beerDetailsBloc.add(
              const BeerDetailsEvent.favouriteChanged(favourite: true),
            ),
            expect: () => <BeerDetailsState>[],
          );

          blocTest<BeerDetailsBloc, BeerDetailsState>(
            'should remove beer from repository when favourite is false',
            build: () => beerDetailsBloc,
            setUp: () {
              when(() => beersRepository.removeFavouriteBeer(beer.id))
                  .thenAnswer((_) => Future.value());
            },
            seed: () => BeerDetailsState(
              loading: false,
              errorType: ErrorType.none,
              beer: beer,
            ),
            act: (_) => beerDetailsBloc.add(
              const BeerDetailsEvent.favouriteChanged(favourite: false),
            ),
            expect: () => <BeerDetailsState>[],
          );

          blocTest<BeerDetailsBloc, BeerDetailsState>(
            'should emit state with ErrorType.unknown '
            'when repository returns failure',
            build: () => beerDetailsBloc,
            setUp: () {
              when(
                () => beersRepository.removeFavouriteBeer(beer.id),
              ).thenAnswer(
                (_) => Future.value(const BeersFailure.unknownError()),
              );
            },
            seed: () => BeerDetailsState(
              loading: false,
              errorType: ErrorType.none,
              beer: beer,
            ),
            act: (_) => beerDetailsBloc.add(
              const BeerDetailsEvent.favouriteChanged(favourite: false),
            ),
            expect: () => [
              BeerDetailsState(
                loading: false,
                errorType: ErrorType.unknown,
                beer: beer,
              ),
            ],
          );
        },
      );

      group(
        'on<_RefreshFavourite>',
        () {
          blocTest<BeerDetailsBloc, BeerDetailsState>(
            'should update beer favourite value from repository',
            build: () => beerDetailsBloc,
            setUp: () {
              when(() => beersRepository.isFavouriteBeer(beerId)).thenAnswer(
                (_) => Future.value(const Right(BeerFavourite(true))),
              );
            },
            seed: () => BeerDetailsState(
              loading: false,
              errorType: ErrorType.none,
              beer: beer.copyWith(favourite: const BeerFavourite(false)),
            ),
            act: (_) => beerDetailsBloc.add(
              const BeerDetailsEvent.refreshFavourite(),
            ),
            expect: () => [
              BeerDetailsState(
                loading: false,
                errorType: ErrorType.none,
                beer: beer.copyWith(favourite: const BeerFavourite(true)),
              ),
            ],
          );

          blocTest<BeerDetailsBloc, BeerDetailsState>(
            'should emit state with ErrorType.unknown '
            'when repository returns failure',
            build: () => beerDetailsBloc,
            setUp: () {
              when(() => beersRepository.isFavouriteBeer(beerId)).thenAnswer(
                (_) => Future.value(const Left(BeersFailure.unknownError())),
              );
            },
            seed: () => BeerDetailsState(
              loading: false,
              errorType: ErrorType.none,
              beer: beer,
            ),
            act: (_) => beerDetailsBloc.add(
              const BeerDetailsEvent.refreshFavourite(),
            ),
            expect: () => [
              BeerDetailsState(
                loading: false,
                errorType: ErrorType.unknown,
                beer: beer,
              ),
            ],
          );
        },
      );
    },
  );
}
