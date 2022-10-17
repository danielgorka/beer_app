import 'package:beer_app/domain/beers/value_objects/beer_mash_duration.dart';
import 'package:beer_app/domain/beers/value_objects/beer_mash_temp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_mash.freezed.dart';

@freezed
class BeerMash with _$BeerMash {
  factory BeerMash({
    required BeerMashTemp temp,
    required BeerMashDuration duration,
  }) = _BeerMash;
}
