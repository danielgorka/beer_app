import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material3_drawer/material3_drawer.dart';

enum NavigationType {
  bottomNav,
  navRail,
  drawer,
}

class NavigationItem {
  NavigationItem({
    required this.route,
    required this.label,
    required this.icon,
    Widget? activeIcon,
  }) : activeIcon = activeIcon ?? icon;

  final PageRouteInfo route;
  final String label;
  final Widget icon;
  final Widget activeIcon;
}

class NavigationScaffold extends StatelessWidget {
  const NavigationScaffold({
    super.key,
    required this.navigationType,
    required this.items,
    this.headerBuilder,
  });

  final NavigationType navigationType;
  final List<NavigationItem> items;
  final HeaderBuilder? headerBuilder;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: items.map((item) => item.route).toList(),
      builder: (context, child, animation) {
        final isBottomNav = navigationType == NavigationType.bottomNav;
        final isNavRail = navigationType == NavigationType.navRail;

        Widget body = FadeScaleTransition(
          animation: animation,
          child: child,
        );

        if (!isBottomNav) {
          body = Row(
            children: [
              _Drawer(
                initialState:
                    isNavRail ? DrawerState.collapsed : DrawerState.expanded,
                collapsible: true,
                items: items,
                onTap: (index) => _onTap(context, index),
                headerBuilder: headerBuilder,
              ),
              Expanded(
                child: body,
              ),
            ],
          );
        }

        return Scaffold(
          body: body,
          bottomNavigationBar: isBottomNav
              ? _BottomNav(
                  items: items,
                  onTap: (index) => _onTap(context, index),
                )
              : null,
        );
      },
    );
  }

  void _onTap(BuildContext context, int index) {
    final tabsRouter = context.tabsRouter;
    if (index == tabsRouter.activeIndex) {
      final route = items[index].route;
      context.router.navigate(route);
    } else {
      tabsRouter.setActiveIndex(index);
    }
  }
}

class _Drawer extends StatelessWidget {
  const _Drawer({
    required this.initialState,
    required this.collapsible,
    required this.items,
    required this.onTap,
    this.headerBuilder,
  });

  final DrawerState initialState;
  final bool collapsible;
  final List<NavigationItem> items;
  final ValueChanged<int> onTap;
  final HeaderBuilder? headerBuilder;

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      initialState: initialState,
      collapsible: collapsible,
      selectedIndex: context.tabsRouter.activeIndex,
      onItemTap: onTap,
      headerBuilder: headerBuilder,
      items: items
          .map(
            (item) => NavigationDrawerItem(
              label: item.label,
              icon: item.icon,
            ),
          )
          .toList(),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.items,
    required this.onTap,
  });

  final List<NavigationItem> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: context.tabsRouter.activeIndex,
      onDestinationSelected: onTap,
      destinations: items
          .map(
            (item) => NavigationDestination(
              icon: item.icon,
              selectedIcon: item.activeIcon,
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}
