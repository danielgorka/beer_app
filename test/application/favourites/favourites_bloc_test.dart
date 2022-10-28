import 'package:beer_app/application/favourites/favourites_bloc.dart';
import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mock_values/beer.dart';
import '../../utils/mockables.dart';

void main() {
  group(
    'FavouritesBloc',
    () {
      final beers = [
        beer,
        beer,
      ];

      late IBeersRepository beersRepository;
      late FavouritesBloc favouritesBloc;

      setUp(() {
        beersRepository = MockBeersRepository();
        favouritesBloc = FavouritesBloc(
          beersRepository: beersRepository,
        );
      });

      test('initialState should be initial', () {
        expect(favouritesBloc.state, equals(FavouritesState.initial()));
      });

      blocTest<FavouritesBloc, FavouritesState>(
        'should add FavouritesEvent.init '
        'on favourites listener called',
        build: () => favouritesBloc,
        setUp: () {
          when(beersRepository.getFavouriteBeers).thenAnswer(
            (_) => Future.value(Right(beers)),
          );
        },
        act: (_) => favouritesBloc.favouriteBeersListener(),
        expect: () => [
          FavouritesState.initial(),
          FavouritesState(
            loading: false,
            hasError: false,
            beers: beers,
          ),
        ],
      );

      group(
        'on<_Init>',
        () {
          Future<Either<BeersFailure, List<Beer>>> repositoryCall() =>
              beersRepository.getFavouriteBeers();

          blocTest<FavouritesBloc, FavouritesState>(
            'should emit state with loading and later '
            'state with beers from repository',
            build: () => favouritesBloc,
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(Right(beers)),
              );
            },
            act: (_) => favouritesBloc.add(const FavouritesEvent.init()),
            expect: () => [
              FavouritesState.initial(),
              FavouritesState(
                loading: false,
                hasError: false,
                beers: beers,
              ),
            ],
          );

          blocTest<FavouritesBloc, FavouritesState>(
            'should emit initial state and later state with error '
            'when repository returns failure',
            build: () => favouritesBloc,
            setUp: () {
              when(repositoryCall).thenAnswer(
                (_) => Future.value(const Left(BeersFailure.unknownError())),
              );
            },
            act: (_) => favouritesBloc.add(const FavouritesEvent.init()),
            expect: () => [
              FavouritesState.initial(),
              const FavouritesState(
                loading: false,
                hasError: true,
                beers: null,
              ),
            ],
          );
        },
      );

      group(
        'on<_FavoriteChanged>',
        () {
          blocTest<FavouritesBloc, FavouritesState>(
            'should save beer in repository when favourite is true',
            build: () => favouritesBloc,
            setUp: () {
              when(() => beersRepository.saveFavouriteBeer(beer))
                  .thenAnswer((_) => Future.value());
            },
            act: (_) => favouritesBloc.add(
              FavouritesEvent.favouriteChanged(
                beer: beer,
                favourite: true,
              ),
            ),
            expect: () => <FavouritesState>[],
          );

          blocTest<FavouritesBloc, FavouritesState>(
            'should remove beer from repository when favourite is false',
            build: () => favouritesBloc,
            setUp: () {
              when(() => beersRepository.removeFavouriteBeer(beer.id))
                  .thenAnswer((_) => Future.value());
            },
            act: (_) => favouritesBloc.add(
              FavouritesEvent.favouriteChanged(
                beer: beer,
                favourite: false,
              ),
            ),
            expect: () => <FavouritesState>[],
          );

          blocTest<FavouritesBloc, FavouritesState>(
            'should emit state with error '
            'when repository returns failure',
            build: () => favouritesBloc,
            setUp: () {
              when(
                () => beersRepository.removeFavouriteBeer(beer.id),
              ).thenAnswer(
                (_) => Future.value(const BeersFailure.unknownError()),
              );
            },
            act: (_) => favouritesBloc.add(
              FavouritesEvent.favouriteChanged(
                beer: beer,
                favourite: false,
              ),
            ),
            expect: () => [
              const FavouritesState(
                loading: false,
                hasError: true,
                beers: null,
              ),
            ],
          );
        },
      );
    },
  );
}
