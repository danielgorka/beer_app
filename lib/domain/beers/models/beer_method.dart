import 'package:beer_app/domain/beers/models/beer_fermentation.dart';
import 'package:beer_app/domain/beers/models/beer_mash.dart';
import 'package:beer_app/domain/beers/value_objects/beer_twist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_method.freezed.dart';

@freezed
class BeerMethod with _$BeerMethod {
  factory BeerMethod({
    required List<BeerMash> mashTemp,
    required BeerFermentation fermentation,
    required BeerTwist twist,
  }) = _BeerMethod;
}
