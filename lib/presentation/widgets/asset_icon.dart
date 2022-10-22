import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.asset, {
    super.key,
    this.color,
    this.size,
    this.isTwoTone = false,
  }) : assert(
          !isTwoTone || color == null,
          'Cannot set color when icon is two tone',
        );

  final String asset;
  final double? size;
  final Color? color;
  final bool isTwoTone;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return SvgPicture.asset(
      asset,
      width: size ?? iconTheme.size,
      height: size ?? iconTheme.size,
      color: isTwoTone ? null : (color ?? iconTheme.color),
    );
  }
}
