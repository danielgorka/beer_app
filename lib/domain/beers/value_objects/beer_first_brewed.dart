import 'package:beer_app/domain/core/value_object.dart';

class BeerFirstBrewed extends ValueObject<DateTime> {
  const BeerFirstBrewed(
    super.value, {
    required this.monthPrecision,
  });

  factory BeerFirstBrewed.fromString(String value) {
    final parts = value.split('/');
    if (parts.length == 1) {
      return BeerFirstBrewed(
        DateTime(int.parse(parts[0])),
        monthPrecision: false,
      );
    } else {
      return BeerFirstBrewed(
        DateTime(int.parse(parts[1]), int.parse(parts[0])),
        monthPrecision: true,
      );
    }
  }

  final bool monthPrecision;

  String get stringValue {
    if (monthPrecision) {
      return '${value.month.toString().padLeft(2, '0')}/${value.year}';
    } else {
      return '${value.year}';
    }
  }
}
