import 'package:auto_route/auto_route.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/assets.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:beer_app/presentation/utils.dart';
import 'package:beer_app/presentation/widgets/asset_icon.dart';
import 'package:beer_app/presentation/widgets/navigation_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.beersRouter = const BeersRouter(),
    this.favouritesBeersRouter = const FavouritesRouter(),
  });

  final PageRouteInfo beersRouter;
  final PageRouteInfo favouritesBeersRouter;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return NavigationScaffold(
            navigationType: _getNavigationType(constraints),
            appBar: AppBar(
              title: Text(context.l10n.appName),
            ),
            headerBuilder: (context, animation) {
              return FadeTransition(
                opacity: animation,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
                  child: Text(
                    context.l10n.appName,
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                  ),
                ),
              );
            },
            items: [
              NavigationItem(
                label: context.l10n.beers,
                icon: const AssetIcon(Assets.mug),
                activeIcon: const AssetIcon(Assets.mugFilled),
                route: beersRouter,
              ),
              NavigationItem(
                label: context.l10n.favourites,
                icon: const AssetIcon(Assets.favMug),
                activeIcon: const AssetIcon(Assets.favMugFilled),
                route: favouritesBeersRouter,
              ),
            ],
          );
        },
      ),
    );
  }

  NavigationType _getNavigationType(BoxConstraints constraints) {
    if (DisplaySize.isLarge(constraints)) {
      return NavigationType.drawer;
    } else if (DisplaySize.isMedium(constraints)) {
      return NavigationType.navRail;
    } else {
      return NavigationType.bottomNav;
    }
  }
}
