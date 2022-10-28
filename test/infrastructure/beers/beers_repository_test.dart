import 'package:beer_app/core/either_ext.dart';
import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_favourite.dart';
import 'package:beer_app/infrastructure/beers/beers_data_source.dart';
import 'package:beer_app/infrastructure/beers/beers_repository.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_dto.dart';
import 'package:beer_app/infrastructure/beers/favourites_data_source.dart';
import 'package:beer_app/infrastructure/core/typedef.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mock_values/beer.dart';
import '../../utils/mockables.dart';

void main() {
  group(
    'BeersRepository',
    () {
      final beers = [beer];
      final beersDto = [beerDto];

      late IBeersDataSource beersDataSource;
      late IFavouritesDataSource favouritesDataSource;
      late BeersRepository beersRepository;

      setUp(() {
        beersDataSource = MockBeersDataSource();
        favouritesDataSource = MockFavouritesDataSource();
        beersRepository = BeersRepository(
          beersDataSource: beersDataSource,
          favouritesDataSource: favouritesDataSource,
        );

        when(favouritesDataSource.getFavouriteBeers)
            .thenAnswer((_) => Future.value(beersDto));
      });

      Future<void> shouldReturnEitherFailure<T, T2>({
        required Exception exception,
        required BeersFailure failure,
        required FutureCallback<T> dataSourceCall,
        required FutureCallback<Either<BeersFailure, T2>> call,
      }) async {
        // arrange
        when(dataSourceCall).thenThrow(exception);

        // act
        final result = await call();

        // assert
        expect(result, Left<BeersFailure, T2>(failure));
        verify(dataSourceCall).called(1);
        verifyNoMoreInteractions(beersDataSource);
        verifyNoMoreInteractions(favouritesDataSource);
      }

      Future<void> shouldReturnFailure<T>({
        required Exception exception,
        required BeersFailure failure,
        required FutureCallback<T> dataSourceCall,
        required FutureCallback<BeersFailure?> call,
      }) async {
        // arrange
        when(dataSourceCall).thenThrow(exception);

        // act
        final result = await call();

        // assert
        expect(result, failure);
        verify(dataSourceCall).called(1);
        verifyNoMoreInteractions(beersDataSource);
        verifyNoMoreInteractions(favouritesDataSource);
      }

      group(
        'getBeers',
        () {
          const page = 3;
          const perPage = 10;

          Future<List<BeerDto>> dataSourceCall() => beersDataSource.getBeers(
                page: page,
                perPage: perPage,
              );

          Future<Either<BeersFailure, List<Beer>>> call() =>
              beersRepository.getBeers(
                page: page,
                perPage: perPage,
              );

          test(
            'should return a list of beers with correct favourite value '
            'when the calls to data sources were successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value(beersDto));

              // act
              final result = await call();

              // assert
              expect(result, isA<Right<BeersFailure, List<Beer>>>());
              expect(result.right, beers);
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
              verify(favouritesDataSource.getFavouriteBeers).called(1);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );

          test(
            'should return BeersFailure.networkError when '
            'the call to beers data source throws a DioError',
            () async {
              await shouldReturnEitherFailure(
                exception: FakeDioError(),
                failure: const BeersFailure.networkError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to beers data source throws other exception',
            () async {
              await shouldReturnEitherFailure(
                exception: Exception(),
                failure: const BeersFailure.unknownError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );
        },
      );

      group(
        'getBeersByName',
        () {
          const query = 'query';
          const page = 3;
          const perPage = 10;

          Future<List<BeerDto>> dataSourceCall() =>
              beersDataSource.getBeersByName(
                query: query,
                page: page,
                perPage: perPage,
              );

          Future<Either<BeersFailure, List<Beer>>> call() =>
              beersRepository.getBeersByName(
                query: query,
                page: page,
                perPage: perPage,
              );

          test(
            'should return a list of beers with correct favourite value '
            'when the calls to data sources were successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value(beersDto));

              // act
              final result = await call();

              // assert
              expect(result, isA<Right<BeersFailure, List<Beer>>>());
              expect(result.right, beers);
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
              verify(favouritesDataSource.getFavouriteBeers).called(1);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );

          test(
            'should return BeersFailure.networkError when '
            'the call to beers data source throws a DioError',
            () async {
              await shouldReturnEitherFailure(
                exception: FakeDioError(),
                failure: const BeersFailure.networkError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to beers data source throws other exception',
            () async {
              await shouldReturnEitherFailure(
                exception: Exception(),
                failure: const BeersFailure.unknownError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );
        },
      );

      group(
        'getBeer',
        () {
          Future<BeerDto> dataSourceCall() =>
              beersDataSource.getBeer(beerId.value);

          Future<Either<BeersFailure, Beer>> call() =>
              beersRepository.getBeer(beerId);

          test(
            'should return the beer with correct favourite value '
            'when the call to beers data source is successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value(beerDto));
              when(() => favouritesDataSource.isFavouriteBeer(beerId.value))
                  .thenAnswer((_) => Future.value(true));

              // act
              final result = await call();

              // assert
              expect(result, isA<Right<BeersFailure, Beer>>());
              expect(result.right, beer);
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
              verify(() => favouritesDataSource.isFavouriteBeer(beerId.value))
                  .called(1);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );

          test(
            'should return BeersFailure.notFound when '
            'the call to beers data source throws a DioError with status 404',
            () async {
              await shouldReturnEitherFailure(
                exception: FakeHttpStatusDioError(404),
                failure: const BeersFailure.notFound(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.networkError when '
            'the call to beers data source throws a DioError',
            () async {
              await shouldReturnEitherFailure(
                exception: FakeDioError(),
                failure: const BeersFailure.networkError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to beers data source throws other exception',
            () async {
              await shouldReturnEitherFailure(
                exception: Exception(),
                failure: const BeersFailure.unknownError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );
        },
      );

      group(
        'addFavouriteBeersListener',
        () {
          test(
            'should add a listener to favourites data source',
            () {
              // arrange
              void listener() {}

              // act
              beersRepository.addFavouriteBeersListener(listener);

              // assert
              verify(() => favouritesDataSource.addListener(listener))
                  .called(1);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );
        },
      );

      group(
        'removeFavouriteBeersListener',
        () {
          test(
            'should remove a listener from favourites data source',
            () {
              // arrange
              void listener() {}

              // act
              beersRepository.removeFavouriteBeersListener(listener);

              // assert
              verify(() => favouritesDataSource.removeListener(listener))
                  .called(1);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );
        },
      );

      group(
        'getFavouriteBeers',
        () {
          Future<List<BeerDto>> dataSourceCall() =>
              favouritesDataSource.getFavouriteBeers();

          Future<Either<BeersFailure, List<Beer>>> call() =>
              beersRepository.getFavouriteBeers();

          test(
            'should return a list of beers '
            'when the call to favourites data source is successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value(beersDto));

              // act
              final result = await call();

              // assert
              expect(result, isA<Right<BeersFailure, List<Beer>>>());
              expect(result.right, beers);
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to favourites data source throws exception',
            () async {
              await shouldReturnEitherFailure(
                exception: Exception(),
                failure: const BeersFailure.unknownError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );
        },
      );

      group(
        'isFavouriteBeer',
        () {
          Future<bool> dataSourceCall() =>
              favouritesDataSource.isFavouriteBeer(beerId.value);

          Future<Either<BeersFailure, BeerFavourite>> call() =>
              beersRepository.isFavouriteBeer(beerId);

          test(
            'should return BeerFavourite '
            'when the call to favourites data source is successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value(true));

              // act
              final result = await call();

              // assert
              expect(
                result,
                const Right<BeersFailure, BeerFavourite>(BeerFavourite(true)),
              );
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to favourites data source throws exception',
            () async {
              await shouldReturnEitherFailure(
                exception: Exception(),
                failure: const BeersFailure.unknownError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );
        },
      );

      group(
        'saveFavouriteBeer',
        () {
          Future<void> dataSourceCall() =>
              favouritesDataSource.saveFavouriteBeer(beerDto);

          Future<BeersFailure?> call() =>
              beersRepository.saveFavouriteBeer(beer);

          test(
            'should return null '
            'when the call to favourites data source is successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value());

              // act
              final result = await call();

              // assert
              expect(result, null);
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to favourites data source throws exception',
            () async {
              await shouldReturnFailure(
                exception: Exception(),
                failure: const BeersFailure.unknownError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );
        },
      );

      group(
        'removeFavouriteBeer',
        () {
          Future<void> dataSourceCall() =>
              favouritesDataSource.removeFavouriteBeer(beerId.value);

          Future<BeersFailure?> call() =>
              beersRepository.removeFavouriteBeer(beerId);

          test(
            'should return null '
            'when the call to favourites data source is successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value());

              // act
              final result = await call();

              // assert
              expect(result, null);
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
              verifyNoMoreInteractions(favouritesDataSource);
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to favourites data source throws exception',
            () async {
              await shouldReturnFailure(
                exception: Exception(),
                failure: const BeersFailure.unknownError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );
        },
      );
    },
  );
}
