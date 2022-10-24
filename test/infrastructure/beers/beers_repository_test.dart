import 'package:beer_app/core/either_ext.dart';
import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/infrastructure/beers/beers_data_source.dart';
import 'package:beer_app/infrastructure/beers/beers_repository.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_dto.dart';
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
      late BeersRepository beersRepository;

      setUp(
        () {
          beersDataSource = MockBeersDataSource();
          beersRepository = BeersRepository(
            beersDataSource: beersDataSource,
          );
        },
      );

      Future<void> shouldReturnFailure<T, T2>({
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
            'should return a list of beers '
            'when the call to data source is successful',
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
            },
          );

          test(
            'should return BeersFailure.networkError when '
            'the call to remote data source throws a DioError',
            () async {
              await shouldReturnFailure(
                exception: FakeDioError(),
                failure: const BeersFailure.networkError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to remote data source throws other exception',
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
            'should return a list of beers '
            'when the call to data source is successful',
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
            },
          );

          test(
            'should return BeersFailure.networkError when '
            'the call to remote data source throws a DioError',
            () async {
              await shouldReturnFailure(
                exception: FakeDioError(),
                failure: const BeersFailure.networkError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to remote data source throws other exception',
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
        'getBeer',
        () {
          Future<BeerDto> dataSourceCall() =>
              beersDataSource.getBeer(beerId.value);

          Future<Either<BeersFailure, Beer>> call() =>
              beersRepository.getBeer(beerId);

          test(
            'should return the beer '
            'when the call to data source is successful',
            () async {
              // arrange
              when(dataSourceCall).thenAnswer((_) => Future.value(beerDto));

              // act
              final result = await call();

              // assert
              expect(result, isA<Right<BeersFailure, Beer>>());
              expect(result.right, beer);
              verify(dataSourceCall).called(1);
              verifyNoMoreInteractions(beersDataSource);
            },
          );

          test(
            'should return BeersFailure.notFound when '
            'the call to remote data source throws a DioError with status 404',
            () async {
              await shouldReturnFailure(
                exception: FakeHttpStatusDioError(404),
                failure: const BeersFailure.notFound(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.networkError when '
            'the call to remote data source throws a DioError',
            () async {
              await shouldReturnFailure(
                exception: FakeDioError(),
                failure: const BeersFailure.networkError(),
                dataSourceCall: dataSourceCall,
                call: call,
              );
            },
          );

          test(
            'should return BeersFailure.unknownError when '
            'the call to remote data source throws other exception',
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
