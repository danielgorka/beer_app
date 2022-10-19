import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:beer_app/presentation/pages/core/home_page.dart';
import 'package:flutter/material.dart';

part 'router.gr.dart';

@CustomAutoRouter(
  preferRelativeImports: false,
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: fadeScale,
  routes: [
    AutoRoute<void>(
      path: '/',
      page: HomePage,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

Widget fadeScale(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeScaleTransition(
    animation: animation,
    child: child,
  );
}
