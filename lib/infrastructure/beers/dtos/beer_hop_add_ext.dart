import 'package:beer_app/domain/beers/value_objects/beer_hop_add.dart';
import 'package:beer_app/infrastructure/core/enum_converter.dart';

const _enumMap = {
  BeerHopAdd.start: 'start',
  BeerHopAdd.middle: 'middle',
  BeerHopAdd.end: 'end',
  BeerHopAdd.dryHop: 'dry hop',
};

extension BeerHopAddExt on BeerHopAdd {
  String getValue() => EnumConverter(_enumMap).enumToString(this);

  static BeerHopAdd fromValue(String value) =>
      EnumConverter(_enumMap).stringToEnum(value);
}
