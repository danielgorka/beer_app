import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness != Brightness.light;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[600]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[500]! : Colors.grey[100]!,
      child: child,
    );
  }
}
