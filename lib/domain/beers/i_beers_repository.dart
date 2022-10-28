import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_favourite.dart';
import 'package:beer_app/domain/beers/value_objects/beer_id.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class IBeersRepository {
  Future<Either<BeersFailure, List<Beer>>> getBeers({
    required int page,
    required int perPage,
  });

  Future<Either<BeersFailure, List<Beer>>> getBeersByName({
    required String query,
    required int page,
    required int perPage,
  });

  Future<Either<BeersFailure, Beer>> getBeer(BeerId id);

  void addFavouriteBeersListener(VoidCallback listener);

  void removeFavouriteBeersListener(VoidCallback listener);

  Future<Either<BeersFailure, List<Beer>>> getFavouriteBeers();

  Future<Either<BeersFailure, BeerFavourite>> isFavouriteBeer(BeerId id);

  Future<BeersFailure?> saveFavouriteBeer(Beer beer);

  Future<BeersFailure?> removeFavouriteBeer(BeerId id);
}
