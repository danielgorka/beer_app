import 'package:beer_app/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BeerPlaceholder extends StatelessWidget {
  const BeerPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Assets.bottle,
      color: Theme.of(context).highlightColor,
    );
  }
}
