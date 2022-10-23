import 'package:auto_route/auto_route.dart';
import 'package:beer_app/presentation/pages/core/home_page.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:beer_app/presentation/widgets/navigation_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mockables.dart';
import '../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'HomePage',
    () {
      late AppRouter mockAppRouter;

      setUpAll(() {
        registerFallbackValue(const PageRouteInfo<void>('', path: ''));
      });

      setUp(() {
        mockAppRouter = MockAppRouter();

        when(() => mockAppRouter.navigate(any()))
            .thenAnswer((_) => Future<void>.value());
        when(() => mockAppRouter.navigateNamed(any()))
            .thenAnswer((_) => Future.value());
      });

      Future<void> pumpWidget(WidgetTester tester) {
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
              child: StackRouterScope(
                controller: mockAppRouter,
                stateHash: 0,
                child: const HomePage(
                  beersRouter: PageRouteInfo<void>(
                    MockStackRouter.tab1,
                    path: MockStackRouter.tab1,
                  ),
                  favouritesBeersRouter: PageRouteInfo<void>(
                    MockStackRouter.tab2,
                    path: MockStackRouter.tab2,
                  ),
                ),
              ),
            ),
          ),
        );
      }

      testWidgets(
        'should onWillPop returns false',
        (tester) async {
          // act
          await pumpWidget(tester);

          final finder = find.byType(WillPopScope);
          final willPopScope = tester.widget<WillPopScope>(finder);
          final result = await willPopScope.onWillPop!();

          // assert
          expect(result, isFalse);
        },
      );

      testWidgets(
        'should show NavigationScaffold with NavigationType.bottomNav '
        'when device is small',
        (tester) async {
          // arrange
          tester.setSmallDisplaySize();

          // act
          await pumpWidget(tester);

          // assert
          final finder = find.byType(NavigationScaffold);
          final navigationScaffold = tester.widget<NavigationScaffold>(finder);
          expect(navigationScaffold.navigationType, NavigationType.bottomNav);
        },
      );

      testWidgets(
        'should show NavigationScaffold with NavigationType.navRail '
        'when device is medium',
        (tester) async {
          // arrange
          tester.setMediumDisplaySize();

          // act
          await pumpWidget(tester);

          // assert
          final finder = find.byType(NavigationScaffold);
          final navigationScaffold = tester.widget<NavigationScaffold>(finder);
          expect(navigationScaffold.navigationType, NavigationType.navRail);
        },
      );

      testWidgets(
        'should show NavigationScaffold with NavigationType.drawer '
        'when device is large',
        (tester) async {
          // arrange
          tester.setLargeDisplaySize();

          // act
          await pumpWidget(tester);

          // assert
          final finder = find.byType(NavigationScaffold);
          final navigationScaffold = tester.widget<NavigationScaffold>(finder);
          expect(navigationScaffold.navigationType, NavigationType.drawer);
        },
      );
    },
  );
}
