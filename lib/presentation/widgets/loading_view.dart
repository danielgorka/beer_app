import 'package:beer_app/presentation/utils.dart';
import 'package:beer_app/presentation/widgets/beer_loading.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
    required this.loading,
    required this.child,
  });

  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: loading ? 0.0 : 1.0,
          duration: standardAnimDuration,
          child: child,
        ),
        if (loading)
          const Positioned.fill(
            child: BeerLoading(),
          )
      ],
    );
  }
}
