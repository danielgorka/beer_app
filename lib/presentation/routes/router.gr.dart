// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return CustomPage<void>(
        routeData: routeData,
        child: HomePage(
          key: args.key,
          beersRouter: args.beersRouter,
          favouritesBeersRouter: args.favouritesBeersRouter,
        ),
        transitionsBuilder: fadeScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BeersRouter.name: (routeData) {
      return CustomPage<void>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: fadeScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FavouritesRouter.name: (routeData) {
      return CustomPage<void>(
        routeData: routeData,
        child: const EmptyRouterPage(),
        transitionsBuilder: fadeScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BeersRoute.name: (routeData) {
      return CustomPage<void>(
        routeData: routeData,
        child: const BeersPage(),
        transitionsBuilder: fadeScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    BeerDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<BeerDetailsRouteArgs>(
          orElse: () => BeerDetailsRouteArgs(beerId: pathParams.getInt('id')));
      return CustomPage<void>(
        routeData: routeData,
        child: BeerDetailsPage(
          key: args.key,
          beerId: args.beerId,
          beer: args.beer,
        ),
        transitionsBuilder: fadeScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SearchRoute.name: (routeData) {
      return CustomPage<void>(
        routeData: routeData,
        child: const SearchPage(),
        transitionsBuilder: fadeScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
    FavouritesRoute.name: (routeData) {
      return CustomPage<void>(
        routeData: routeData,
        child: const FavouritesPage(),
        transitionsBuilder: fadeScale,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            RouteConfig(
              BeersRouter.name,
              path: 'beers',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  BeersRoute.name,
                  path: '',
                  parent: BeersRouter.name,
                ),
                RouteConfig(
                  BeerDetailsRoute.name,
                  path: ':id',
                  parent: BeersRouter.name,
                ),
                RouteConfig(
                  SearchRoute.name,
                  path: 'search',
                  parent: BeersRouter.name,
                ),
                RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: BeersRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            RouteConfig(
              FavouritesRouter.name,
              path: 'favourites',
              parent: HomeRoute.name,
              children: [
                RouteConfig(
                  FavouritesRoute.name,
                  path: '',
                  parent: FavouritesRouter.name,
                ),
                RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: FavouritesRouter.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    PageRouteInfo<dynamic> beersRouter = const BeersRouter(),
    PageRouteInfo<dynamic> favouritesBeersRouter = const FavouritesRouter(),
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(
            key: key,
            beersRouter: beersRouter,
            favouritesBeersRouter: favouritesBeersRouter,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    this.beersRouter = const BeersRouter(),
    this.favouritesBeersRouter = const FavouritesRouter(),
  });

  final Key? key;

  final PageRouteInfo<dynamic> beersRouter;

  final PageRouteInfo<dynamic> favouritesBeersRouter;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, beersRouter: $beersRouter, favouritesBeersRouter: $favouritesBeersRouter}';
  }
}

/// generated route for
/// [EmptyRouterPage]
class BeersRouter extends PageRouteInfo<void> {
  const BeersRouter({List<PageRouteInfo>? children})
      : super(
          BeersRouter.name,
          path: 'beers',
          initialChildren: children,
        );

  static const String name = 'BeersRouter';
}

/// generated route for
/// [EmptyRouterPage]
class FavouritesRouter extends PageRouteInfo<void> {
  const FavouritesRouter({List<PageRouteInfo>? children})
      : super(
          FavouritesRouter.name,
          path: 'favourites',
          initialChildren: children,
        );

  static const String name = 'FavouritesRouter';
}

/// generated route for
/// [BeersPage]
class BeersRoute extends PageRouteInfo<void> {
  const BeersRoute()
      : super(
          BeersRoute.name,
          path: '',
        );

  static const String name = 'BeersRoute';
}

/// generated route for
/// [BeerDetailsPage]
class BeerDetailsRoute extends PageRouteInfo<BeerDetailsRouteArgs> {
  BeerDetailsRoute({
    Key? key,
    required int beerId,
    Beer? beer,
  }) : super(
          BeerDetailsRoute.name,
          path: ':id',
          args: BeerDetailsRouteArgs(
            key: key,
            beerId: beerId,
            beer: beer,
          ),
          rawPathParams: {'id': beerId},
        );

  static const String name = 'BeerDetailsRoute';
}

class BeerDetailsRouteArgs {
  const BeerDetailsRouteArgs({
    this.key,
    required this.beerId,
    this.beer,
  });

  final Key? key;

  final int beerId;

  final Beer? beer;

  @override
  String toString() {
    return 'BeerDetailsRouteArgs{key: $key, beerId: $beerId, beer: $beer}';
  }
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [FavouritesPage]
class FavouritesRoute extends PageRouteInfo<void> {
  const FavouritesRoute()
      : super(
          FavouritesRoute.name,
          path: '',
        );

  static const String name = 'FavouritesRoute';
}
