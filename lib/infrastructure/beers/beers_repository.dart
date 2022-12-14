import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/i_beers_repository.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_favourite.dart';
import 'package:beer_app/domain/beers/value_objects/beer_id.dart';
import 'package:beer_app/infrastructure/beers/beers_data_source.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_dto.dart';
import 'package:beer_app/infrastructure/beers/favourites_data_source.dart';
import 'package:beer_app/infrastructure/core/http_status.dart';
import 'package:beer_app/infrastructure/core/typedef.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IBeersRepository)
class BeersRepository extends IBeersRepository {
  BeersRepository({
    required this.beersDataSource,
    required this.favouritesDataSource,
  });

  final IBeersDataSource beersDataSource;
  final IFavouritesDataSource favouritesDataSource;

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

      final favourites = await favouritesDataSource.getFavouriteBeers();

      return beers
          .map((e) => e.toDomain(favourite: favourites.contains(e)))
          .toList();
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

      final favourites = await favouritesDataSource.getFavouriteBeers();

      return beers
          .map((e) => e.toDomain(favourite: favourites.contains(e)))
          .toList();
    });
  }

  @override
  Future<Either<BeersFailure, Beer>> getBeer(BeerId id) {
    return _run(() async {
      final beers = await beersDataSource.getBeer(id.value);
      final beer = beers.first;
      final favourite = await favouritesDataSource.isFavouriteBeer(id.value);

      return beer.toDomain(
        favourite: favourite,
      );
    });
  }

  @override
  void addFavouriteBeersListener(VoidCallback listener) {
    favouritesDataSource.addListener(listener);
  }

  @override
  void removeFavouriteBeersListener(VoidCallback listener) {
    favouritesDataSource.removeListener(listener);
  }

  @override
  Future<Either<BeersFailure, List<Beer>>> getFavouriteBeers() async {
    return _run(() async {
      final beers = await favouritesDataSource.getFavouriteBeers();

      return beers.map((e) => e.toDomain(favourite: true)).toList();
    });
  }

  @override
  Future<Either<BeersFailure, BeerFavourite>> isFavouriteBeer(BeerId id) async {
    return _run(() async {
      final favourite = await favouritesDataSource.isFavouriteBeer(id.value);

      return BeerFavourite(favourite);
    });
  }

  @override
  Future<BeersFailure?> saveFavouriteBeer(Beer beer) async {
    final either = await _run(() async {
      await favouritesDataSource.saveFavouriteBeer(BeerDto.fromDomain(beer));
    });

    return either.fold((l) => l, (r) => null);
  }

  @override
  Future<BeersFailure?> removeFavouriteBeer(BeerId id) async {
    final either = await _run(() async {
      await favouritesDataSource.removeFavouriteBeer(id.value);
    });

    return either.fold((l) => l, (r) => null);
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
