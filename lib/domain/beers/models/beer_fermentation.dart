import 'package:beer_app/domain/beers/value_objects/beer_fermentation_temp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer_fermentation.freezed.dart';

@freezed
class BeerFermentation with _$BeerFermentation {
  factory BeerFermentation({
    required BeerFermentationTemp temp,
  }) = _BeerFermentation;
}
