import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/presentation/pages/beer_details/beer_details_page.dart';
import 'package:beer_app/presentation/pages/beers/beers_page.dart';
import 'package:beer_app/presentation/pages/core/home_page.dart';
import 'package:beer_app/presentation/pages/favourites/favourites_page.dart';
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
      children: [
        AutoRoute<void>(
          path: 'beers',
          name: 'BeersRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute<void>(
              path: '',
              page: BeersPage,
            ),
            AutoRoute<void>(
              path: ':id',
              page: BeerDetailsPage,
            ),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute<void>(
          path: 'favourites',
          name: 'FavouritesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute<void>(
              path: '',
              page: FavouritesPage,
            ),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
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
