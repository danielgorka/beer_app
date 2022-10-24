import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_id.dart';
import 'package:beer_app/infrastructure/beers/beers_data_source.dart';
import 'package:beer_app/infrastructure/core/http_status.dart';
import 'package:beer_app/infrastructure/core/typedef.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBeersRepository)
class BeersRepository extends IBeersRepository {
  BeersRepository({
    required this.beersDataSource,
  });

  final IBeersDataSource beersDataSource;

  @override
  Future<Either<BeersFailure, List<Beer>>> getBeers({
    required int page,
    required int perPage,
  }) async {
    return _run(() async {
      final beers = await beersDataSource.getBeers(
        page: page,
        perPage: perPage,
      );

      return beers.map((e) => e.toDomain()).toList();
    });
  }

  @override
  Future<Either<BeersFailure, List<Beer>>> getBeersByName({
    required String query,
    required int page,
    required int perPage,
  }) async {
    return _run(() async {
      final beers = await beersDataSource.getBeersByName(
        query: query,
        page: page,
        perPage: perPage,
      );

      return beers.map((e) => e.toDomain()).toList();
    });
  }

  @override
  Future<Either<BeersFailure, Beer>> getBeer(BeerId id) {
    return _run(() async {
      final beer = await beersDataSource.getBeer(id.value);

      return beer.toDomain();
    });
  }

  Future<Either<BeersFailure, T>> _run<T>(FutureCallback<T> run) async {
    try {
      return Right(await run());
    } on DioError catch (e) {
      if (e.type == DioErrorType.response &&
          e.response?.statusCode == HttpStatus.notFound) {
        return const Left(BeersFailure.notFound());
      }
      return const Left(BeersFailure.networkError());
    } catch (e) {
      return const Left(BeersFailure.unknownError());
    }
  }
}
