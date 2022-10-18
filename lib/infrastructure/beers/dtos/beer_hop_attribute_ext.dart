import 'package:beer_app/domain/beers/value_objects/beer_hop_attribute.dart';
import 'package:beer_app/infrastructure/core/enum_converter.dart';

const _enumMap = {
  BeerHopAttribute.bitter: 'bitter',
  BeerHopAttribute.aroma: 'aroma',
  BeerHopAttribute.flavour: 'flavour',
  BeerHopAttribute.twist: 'twist',
};

extension BeerHopAttributeExt on BeerHopAttribute {
  String getValue() => EnumConverter(_enumMap).enumToString(this);

  static BeerHopAttribute fromValue(String value) =>
      EnumConverter(_enumMap).stringToEnum(value);
}
