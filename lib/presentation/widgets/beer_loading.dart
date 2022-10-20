import 'package:beer_app/presentation/assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

const _indicatorSize = 100.0;

class BeerLoading extends StatelessWidget {
  const BeerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: _indicatorSize,
        height: _indicatorSize,
        child: RiveAnimation.asset(Assets.beerLoading),
      ),
    );
  }
}
