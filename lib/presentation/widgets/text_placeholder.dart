import 'package:beer_app/presentation/utils.dart';
import 'package:flutter/material.dart';

class TextPlaceholder extends StatelessWidget {
  const TextPlaceholder({
    super.key,
    this.padding,
    this.width,
    this.height,
  });

  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
