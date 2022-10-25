import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimatedFadeScale extends ImplicitlyAnimatedWidget {
  const AnimatedFadeScale({
    super.key,
    this.child,
    required this.visible,
    super.curve,
    required super.duration,
    super.onEnd,
  });

  final Widget? child;

  final bool visible;

  @override
  ImplicitlyAnimatedWidgetState<AnimatedFadeScale> createState() =>
      _AnimatedFadeScaleState();
}

class _AnimatedFadeScaleState
    extends ImplicitlyAnimatedWidgetState<AnimatedFadeScale> {
  Tween<double>? _tween;
  late Animation<double> _visibilityAnimation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _tween = visitor(
      _tween,
      widget.visible ? 1.0 : 0.0,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  void didUpdateTweens() {
    _visibilityAnimation = animation.drive(_tween!);
  }

  @override
  Widget build(BuildContext context) {
    return FadeScaleTransition(
      animation: _visibilityAnimation,
      child: widget.child,
    );
  }
}
