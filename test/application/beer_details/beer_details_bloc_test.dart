import 'package:beer_app/application/beer_details/beer_details_bloc.dart';
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
    'BeerBloc',
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
    },
  );
}
