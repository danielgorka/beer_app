import 'package:beer_app/domain/beers/value_objects/beer_hop_attribute.dart';
import 'package:beer_app/infrastructure/core/enum_converter.dart';

const _enumMap = {
  'bitter': BeerHopAttribute.bitter,
  'bittering': BeerHopAttribute.bitter,
  'bitering': BeerHopAttribute.bitter,
  'aroma': BeerHopAttribute.aroma,
  'flavour': BeerHopAttribute.flavour,
  'flavoour': BeerHopAttribute.flavour,
  'flavouor': BeerHopAttribute.flavour,
  'twist': BeerHopAttribute.twist,
  'aroma / bitter': BeerHopAttribute.aromaBitter,
  'wood ageing': BeerHopAttribute.woodAgeing,
};

extension BeerHopAttributeExt on BeerHopAttribute {
  String getValue() => EnumConverter(_enumMap).enumToString(this);

  static BeerHopAttribute fromValue(String value) =>
      EnumConverter(_enumMap).stringToEnum(value);
}
