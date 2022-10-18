import 'package:beer_app/domain/beers/models/beer_ingredients.dart';
import 'package:beer_app/domain/beers/models/beer_method.dart';
import 'package:beer_app/domain/beers/value_objects/beer_abv.dart';
import 'package:beer_app/domain/beers/value_objects/beer_attenuation_level.dart';
import 'package:beer_app/domain/beers/value_objects/beer_boil_volume.dart';
import 'package:beer_app/domain/beers/value_objects/beer_brewers_tips.dart';
import 'package:beer_app/domain/beers/value_objects/beer_contributed_by.dart';
import 'package:beer_app/domain/beers/value_objects/beer_description.dart';
import 'package:beer_app/domain/beers/value_objects/beer_ebc.dart';
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
import 'package:freezed_annotation/freezed_annotation.dart';

part 'beer.freezed.dart';

@freezed
class Beer with _$Beer {
  factory Beer({
    required BeerId id,
    required BeerName name,
    required BeerTagline tagline,
    required BeerFirstBrewed firstBrewed,
    required BeerDescription description,
    required BeerImageUrl imageUrl,
    required BeerAbv abv,
    required BeerIbu ibu,
    required BeerTargetFg targetFg,
    required BeerTargetOg targetOg,
    required BeerEbc ebc,
    required BeerSrm srm,
    required BeerPh ph,
    required BeerAttenuationLevel attenuationLevel,
    required BeerVolume volume,
    required BeerBoilVolume boilVolume,
    required BeerMethod method,
    required BeerIngredients ingredients,
    required List<BeerFood> foodPairing,
    required BeerBrewersTips brewersTips,
    required BeerContributedBy contributedBy,
  }) = _Beer;
}
