import 'package:beer_app/domain/beers/models/beer_method.dart';
import 'package:beer_app/domain/beers/value_objects/beer_twist.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_method_dto.dart';

import 'beer_fermentation.dart';
import 'beer_mash.dart';

const beerTwist = BeerTwist(
  'Based on AB:04, but with added vanilla and 3.5 times the chilli.',
);
// Model
final beerMethod = BeerMethod(
  mashTemp: [beerMash],
  fermentation: beerFermentation,
  twist: beerTwist,
);

// DTO
final beerMethodDto = BeerMethodDto(
  mashTemp: [beerMashDto],
  fermentation: beerFermentationDto,
  twist: beerTwist.value,
);

// JSON
final beerMethodJson = {
  'mash_temp': [beerMashJson],
  'fermentation': beerFermentationJson,
  'twist': beerTwist.value,
};
