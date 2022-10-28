import 'dart:convert';

import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/domain/beers/value_objects/beer_abv.dart';
import 'package:beer_app/domain/beers/value_objects/beer_attenuation_level.dart';
import 'package:beer_app/domain/beers/value_objects/beer_boil_volume.dart';
import 'package:beer_app/domain/beers/value_objects/beer_brewers_tips.dart';
import 'package:beer_app/domain/beers/value_objects/beer_contributed_by.dart';
import 'package:beer_app/domain/beers/value_objects/beer_description.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ebc.dart';
import 'package:beer_app/domain/beers/value_objects/beer_favourite.dart';
import 'package:beer_app/domain/beers/value_objects/beer_first_brewed.dart';
import 'package:beer_app/domain/beers/value_objects/beer_food.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ibu.dart';
import 'package:beer_app/domain/beers/value_objects/beer_id.dart';
import 'package:beer_app/domain/beers/value_objects/beer_image_url.dart';
import 'package:beer_app/domain/beers/value_objects/beer_name.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ph.dart';
import 'package:beer_app/domain/beers/value_objects/beer_srm.dart';
import 'package:beer_app/domain/beers/value_objects/beer_tagline.dart';
import 'package:beer_app/domain/beers/value_objects/beer_target_fg.dart';
import 'package:beer_app/domain/beers/value_objects/beer_target_og.dart';
import 'package:beer_app/domain/beers/value_objects/beer_volume.dart';
import 'package:beer_app/domain/core/unit.dart';
import 'package:beer_app/infrastructure/beers/dtos/beer_dto.dart';
import 'package:beer_app/infrastructure/core/unit_value_dto.dart';

import 'beer_ingredients.dart';
import 'beer_method.dart';

const beerId = BeerId(21);
const beerFavourite = BeerFavourite(true);
const beerName = BeerName('Skull Candy');
const beerTagline = BeerTagline('Pacific Hopped Amber Bitter.');
final beerFirstBrewed = BeerFirstBrewed(
  DateTime(2010, 2),
  monthPrecision: true,
);
const beerDescription = BeerDescription('The first beer that we brewed on our '
    'newly commissioned 5000 litre brewhouse in Fraserburgh 2009. '
    'A beer with the malt and body of an English bitter, '
    'but the heart and soul of vibrant citrus US hops.');
const beerImageUrl = BeerImageUrl('https://images.punkapi.com/v2/keg.png');
const beerAbv = BeerAbv(3.5);
const beerIbu = BeerIbu(33);
const beerTargetFg = BeerTargetFg(1012);
const beerTargetOg = BeerTargetOg(1038);
const beerEbc = BeerEbc(50);
const beerSrm = BeerSrm(25);
const beerPh = BeerPh(4.4);
const beerAttenuationLevel = BeerAttenuationLevel(68.4);
const beerVolume = BeerVolume(20, Unit.litres);
const beerBoilVolume = BeerBoilVolume(25, Unit.litres);
const beerFoodPairing = [
  BeerFood('Haggis bon bons'),
  BeerFood('Rosemary and lemon roast chicken'),
  BeerFood('Oatmeal and cranberry cookies'),
];
const beerBrewersTips = BeerBrewersTips(
  'Make sure your hops are well broken up and mixed in '
  'when added to the kettle for aroma additions. '
  'The wort is not boiling so is not agitating the hops '
  "to allow mixing. If the hops aren't steeped properly "
  "in the wort you won't get the maximum flavour impact.",
);
const beerContributedBy = BeerContributedBy('Sam Mason <samjbmason>');

// Model
final beer = Beer(
  id: beerId,
  favourite: beerFavourite,
  name: beerName,
  tagline: beerTagline,
  firstBrewed: beerFirstBrewed,
  description: beerDescription,
  imageUrl: beerImageUrl,
  abv: beerAbv,
  ibu: beerIbu,
  targetFg: beerTargetFg,
  targetOg: beerTargetOg,
  ebc: beerEbc,
  srm: beerSrm,
  ph: beerPh,
  attenuationLevel: beerAttenuationLevel,
  volume: beerVolume,
  boilVolume: beerBoilVolume,
  method: beerMethod,
  ingredients: beerIngredients,
  foodPairing: beerFoodPairing,
  brewersTips: beerBrewersTips,
  contributedBy: beerContributedBy,
);

// DTO
final beerDto = BeerDto(
  id: beerId.value,
  name: beerName.value,
  tagline: beerTagline.value,
  firstBrewed: beerFirstBrewed.stringValue,
  description: beerDescription.value,
  imageUrl: beerImageUrl.value,
  abv: beerAbv.value,
  ibu: beerIbu.value,
  targetFg: beerTargetFg.value,
  targetOg: beerTargetOg.value,
  ebc: beerEbc.value,
  srm: beerSrm.value,
  ph: beerPh.value,
  attenuationLevel: beerAttenuationLevel.value,
  volume: UnitValueDto.fromDomain(beerVolume),
  boilVolume: UnitValueDto.fromDomain(beerBoilVolume),
  method: beerMethodDto,
  ingredients: beerIngredientsDto,
  foodPairing: beerFoodPairing.map((e) => e.value).toList(),
  brewersTips: beerBrewersTips.value,
  contributedBy: beerContributedBy.value,
);

// JSON
final beerJson = {
  'id': beerId.value,
  'name': beerName.value,
  'tagline': beerTagline.value,
  'first_brewed': beerFirstBrewed.stringValue,
  'description': beerDescription.value,
  'image_url': beerImageUrl.value,
  'abv': beerAbv.value,
  'ibu': beerIbu.value,
  'target_fg': beerTargetFg.value,
  'target_og': beerTargetOg.value,
  'ebc': beerEbc.value,
  'srm': beerSrm.value,
  'ph': beerPh.value,
  'attenuation_level': beerAttenuationLevel.value,
  'volume': {
    'value': 20.0,
    'unit': 'litres',
  },
  'boil_volume': {
    'value': 25.0,
    'unit': 'litres',
  },
  'method': beerMethodJson,
  'ingredients': beerIngredientsJson,
  'food_pairing': beerFoodPairing.map((e) => e.value).toList(),
  'brewers_tips': beerBrewersTips.value,
  'contributed_by': beerContributedBy.value,
};

final beerJsonString = jsonEncode(beerJson);
