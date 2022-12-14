import 'package:beer_app/presentation/utils.dart' as utils;
import 'package:flutter/material.dart';

class MaterialCard extends StatelessWidget {
  const MaterialCard({
    super.key,
    this.elevation = utils.ElevationLevel.level0,
    this.borderRadius,
    this.color,
    this.child,
  });

  final utils.ElevationLevel elevation;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      elevation: elevation.elevation,
      borderRadius: borderRadius ?? utils.borderRadius,
      surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
      color: color,
      child: child,
    );
  }
}
