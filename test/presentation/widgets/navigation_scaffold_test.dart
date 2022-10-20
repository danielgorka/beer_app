import 'package:auto_route/auto_route.dart';
import 'package:beer_app/presentation/widgets/navigation_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material3_drawer/material3_drawer.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/mockables.dart';
import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'NavigationScaffold',
    () {
      final items = [
        NavigationItem(
          route: const PageRouteInfo<void>(
            MockStackRouter.tab1,
            path: MockStackRouter.tab1,
          ),
          label: 'Item 1',
          icon: const Icon(Icons.looks_one_outlined),
        ),
        NavigationItem(
          route: const PageRouteInfo<void>(
            MockStackRouter.tab2,
            path: MockStackRouter.tab2,
          ),
          label: 'Item 2',
          icon: const Icon(Icons.looks_two),
        ),
      ];

      Future<void> pumpWidget(WidgetTester tester, Widget widget) {
        return tester.pumpAppWidget(
          RouteDataScope(
            routeData: RouteData(
              route: const RouteMatch<dynamic>(
                name: MockStackRouter.main,
                segments: [],
                path: '/',
                stringMatch: '/',
                key: ValueKey(MockStackRouter.main),
              ),
              router: MockStackRouter(),
              pendingChildren: [],
            ),
            child: RouterScope(
              stateHash: 0,
              inheritableObserversBuilder: () => [],
              navigatorObservers: const [],
              controller: MockStackRouter(),
              child: widget,
            ),
          ),
        );
      }

      testWidgets(
        'should show AppBar when NavigationType is bottomNav',
        (tester) async {
          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.bottomNav,
              items: items,
            ),
          );

          // assert
          expect(find.byType(AppBar), findsOneWidget);
        },
      );

      testWidgets(
        'should not show AppBar when NavigationType is navRail',
        (tester) async {
          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.navRail,
              items: items,
            ),
          );

          // assert
          expect(find.byType(AppBar), findsNothing);
        },
      );

      testWidgets(
        'should not show AppBar when NavigationType is drawer',
        (tester) async {
          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.drawer,
              items: items,
            ),
          );

          // assert
          expect(find.byType(AppBar), findsNothing);
        },
      );

      testWidgets(
        'should show NavigationBar and not show NavigationDrawer '
        'when NavigationType is bottomNav',
        (tester) async {
          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.bottomNav,
              items: items,
            ),
          );

          // assert
          expect(find.byType(NavigationBar), findsOneWidget);
          expect(find.byType(NavigationDrawer), findsNothing);
        },
      );

      testWidgets(
        'should not show NavigationBar and show collapsed NavigationDrawer '
        'when NavigationType is navRail',
        (tester) async {
          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.navRail,
              items: items,
            ),
          );

          // assert
          final finder = find.byType(NavigationDrawer);
          final navigationDrawer = tester.widget<NavigationDrawer>(finder);
          expect(navigationDrawer.initialState, DrawerState.collapsed);
        },
      );

      testWidgets(
        'should not show NavigationBar and show expanded NavigationDrawer '
        'when NavigationType is drawer',
        (tester) async {
          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.drawer,
              items: items,
            ),
          );

          // assert
          final finder = find.byType(NavigationDrawer);
          final navigationDrawer = tester.widget<NavigationDrawer>(finder);
          expect(navigationDrawer.initialState, DrawerState.expanded);
        },
      );

      testWidgets(
        'should call TabsRouter.setActiveIndex on other item tap '
        'when NavigationType is bottomNav',
        (tester) async {
          // arrange
          const index = 1;

          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.bottomNav,
              items: items,
            ),
          );

          await tester.tap(find.text('Item 2'));
          await tester.pumpAndSettle();

          // assert
          final finder = find.byType(NavigationBar);
          final context = tester.element(finder);
          expect(context.tabsRouter.activeIndex, index);
        },
      );

      testWidgets(
        'should call TabsRouter.setActiveIndex on other item tap '
        'when NavigationType is drawer',
        (tester) async {
          // arrange
          const index = 1;

          // act
          await pumpWidget(
            tester,
            NavigationScaffold(
              navigationType: NavigationType.drawer,
              items: items,
            ),
          );

          await tester.tap(find.text('Item 2').first);
          await tester.pumpAndSettle();

          // assert
          final finder = find.byType(NavigationDrawer);
          final context = tester.element(finder);
          expect(context.tabsRouter.activeIndex, index);
        },
      );

      testWidgets(
        'should navigate to main route on same item tap',
        (tester) async {
          // arrange
          const firstRoute = PageRouteInfo<void>(
            MockStackRouter.tab1,
            path: MockStackRouter.tab1,
          );
          final mockAppRouter = MockAppRouter();
          when(() => mockAppRouter.navigate(firstRoute))
              .thenAnswer((_) => Future<void>.value());

          // act
          await pumpWidget(
            tester,
            StackRouterScope(
              controller: mockAppRouter,
              stateHash: 0,
              child: NavigationScaffold(
                navigationType: NavigationType.drawer,
                items: items,
              ),
            ),
          );

          await tester.tap(find.text('Item 1').first);
          await tester.pumpAndSettle();

          // assert
          verify(() => mockAppRouter.navigate(firstRoute)).called(1);
        },
      );
    },
  );
}
