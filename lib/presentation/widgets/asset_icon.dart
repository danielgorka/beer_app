import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.asset, {
    super.key,
  });

  final String asset;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return SvgPicture.asset(
      asset,
      width: iconTheme.size,
      height: iconTheme.size,
      color: iconTheme.color,
    );
  }
}
