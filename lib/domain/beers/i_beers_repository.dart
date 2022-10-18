import 'package:beer_app/domain/beers/beers_failure.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_id.dart';
import 'package:dartz/dartz.dart';

abstract class IBeersRepository {
  Future<Either<BeersFailure, List<Beer>>> getBeers({
    required int page,
    required int perPage,
  });

  Future<Either<BeersFailure, Beer>> getBeer(BeerId id);
}
