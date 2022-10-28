import 'package:auto_route/auto_route.dart';
import 'package:beer_app/domain/beers/models/beer.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/app_icons.dart';
import 'package:beer_app/presentation/pages/beers/utils.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item_placeholder.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beers_view.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:beer_app/presentation/widgets/app_shimmer.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:beer_app/presentation/widgets/sliver_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/mockables.dart';
import '../../../../utils/widget_switcher.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeersView',
    () {
      const limit = 10;
      final beers = List.generate(limit * 2, (index) => beer);

      var reloadCalls = 0;
      void reload() {
        reloadCalls++;
      }

      var loadMoreCalls = 0;
      void loadMore() {
        loadMoreCalls++;
      }

      setUp(() {
        reloadCalls = 0;
        loadMoreCalls = 0;
      });

      testWidgets(
        'should show SliverSearchBar when showSearchBar is true',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: true,
              beers: beers,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          // assert
          expect(find.byType(SliverSearchBar), findsOneWidget);
        },
      );

      testWidgets(
        'should not show SliverSearchBar when showSearchBar is false',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          // assert
          expect(find.byType(SliverSearchBar), findsNothing);
        },
      );

      testWidgets(
        'should push SearchPage on SliverSearchBar tap',
        (tester) async {
          // arrange
          final mockAppRouter = MockAppRouter();
          const route = SearchRoute();

          when(() => mockAppRouter.push(route))
              .thenAnswer((_) => Future.value());

          // act
          await tester.pumpAppWidget(
            StackRouterScope(
              controller: mockAppRouter,
              stateHash: 0,
              child: BeersView(
                showSearchBar: true,
                beers: beers,
                hasError: false,
                canLoadMore: true,
                beersLimit: limit,
                reload: reload,
                loadMore: loadMore,
                onFavouriteChanged: (_, __) {},
              ),
            ),
          );

          await tester.tap(find.byIcon(AppIcons.search));
          await tester.pumpAndSettle();

          // assert
          verify(() => mockAppRouter.push(route)).called(1);
        },
      );

      testWidgets(
        'should show SliverGrid wrapped with SliverPadding',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          // assert
          final finder = find.byType(SliverGrid);
          final sliverGrid = tester.widget<SliverGrid>(finder);
          expect(sliverGrid.gridDelegate, beersGridViewDelegate);

          final sliverPaddingFinder = find.ancestor(
            of: finder,
            matching: find.byType(SliverPadding),
          );
          final sliverPadding = tester.widget<SliverPadding>(
            sliverPaddingFinder,
          );
          expect(sliverPadding.padding, beersViewPadding);
        },
      );

      testWidgets(
        'should show BeerItems and BeerItemPlaceholder wrapped with Shimmer',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          // assert
          expect(find.byType(BeerItem), findsWidgets);

          // act
          final lastLoadingItemFinder = find.byWidgetPredicate(
            (widget) =>
                widget is IndexedSemantics &&
                widget.index == beers.length + limit - 1,
          );
          await tester.scrollUntilVisible(lastLoadingItemFinder, 200);

          // assert
          expect(
            find.descendant(
              of: find.byType(AppShimmer),
              matching: find.byType(BeerItemPlaceholder),
            ),
            findsWidgets,
          );
        },
      );

      testWidgets(
        'should not show BeerItemPlaceholder when canLoadMore is false',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: false,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          // assert
          expect(find.byType(BeerItem), findsWidgets);

          // act
          final lastItemFinder = find.byWidgetPredicate(
            (widget) =>
                widget is IndexedSemantics && widget.index == beers.length - 1,
          );
          await tester.scrollUntilVisible(lastItemFinder, 200);

          await tester.drag(find.byType(Scrollable), const Offset(0, -200));
          await tester.pump();

          // assert
          expect(find.byType(BeerItemPlaceholder), findsNothing);
        },
      );

      testWidgets(
        'should not show BeerItems and show BeerItemPlaceholder '
        'when beers is null',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: null,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          // assert
          expect(find.byType(BeerItem), findsNothing);
          expect(find.byType(BeerItemPlaceholder), findsWidgets);
        },
      );

      testWidgets(
        'should not show BeerItemPlaceholder when hasError is true',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: true,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          // assert
          expect(find.byType(BeerItem), findsWidgets);

          // act
          final lastItemFinder = find.byWidgetPredicate(
            (widget) =>
                widget is IndexedSemantics && widget.index == beers.length - 1,
          );
          await tester.scrollUntilVisible(lastItemFinder, 200);

          await tester.drag(find.byType(Scrollable), const Offset(0, -200));
          await tester.pump();

          // assert
          expect(find.byType(BeerItemPlaceholder), findsNothing);
        },
      );

      testWidgets(
        'should show ErrorView when hasError is true',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: true,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          await tester.scrollUntilVisible(find.byType(ErrorView), 200);

          // assert
          expect(find.byType(ErrorView), findsOneWidget);
        },
      );

      testWidgets(
        'should call loadMore on try again pressed in ErrorView',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: true,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          final context = tester.element(find.byType(BeersView));
          final btnFinder = find.text(context.l10n.tryAgain);
          await tester.scrollUntilVisible(btnFinder, 200);

          await tester.drag(find.byType(Scrollable), const Offset(0, -200));
          await tester.pump();

          await tester.tap(btnFinder);
          await tester.pump();

          // assert
          expect(reloadCalls, 0);
          expect(loadMoreCalls, 1);
        },
      );

      testWidgets(
        'should call reload on refresh LoadingIndicator',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          await tester.drag(
            find.byType(RefreshIndicator),
            const Offset(0, 300),
          );
          await tester.pumpAndSettle();

          // assert
          expect(reloadCalls, 1);
          expect(loadMoreCalls, 0);
        },
      );

      testWidgets(
        'should call onFavouriteChanged '
        'when BeerItem.onFavouriteChanged is called',
        (tester) async {
          // arrange
          Beer? calledBeer;
          bool? calledValue;

          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (beer, favourite) {
                calledBeer = beer;
                calledValue = favourite;
              },
            ),
          );

          final finder = find.byType(BeerItem).first;
          final beerItem = tester.widget<BeerItem>(finder);
          beerItem.onFavouriteChanged(true);

          // assert
          expect(calledBeer, beer);
          expect(calledValue, true);
        },
      );

      testWidgets(
        'should call loadMore when user scrolls to last item',
        (tester) async {
          // arrange
          tester.setSmallDisplaySize();

          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          final lastItemFinder = find.byWidgetPredicate(
            (widget) =>
                widget is IndexedSemantics && widget.index == beers.length - 1,
          );
          await tester.scrollUntilVisible(lastItemFinder, 200);

          // assert
          expect(reloadCalls, 0);
          expect(loadMoreCalls, greaterThan(0));
        },
      );

      testWidgets(
        'should not call loadMore when user scrolls '
        'to last item but canLoadMore is false',
        (tester) async {
          // arrange
          tester.setSmallDisplaySize();

          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: false,
              canLoadMore: false,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          final lastItemFinder = find.byWidgetPredicate(
            (widget) =>
                widget is IndexedSemantics && widget.index == beers.length - 1,
          );
          await tester.scrollUntilVisible(lastItemFinder, 200);

          // assert
          expect(reloadCalls, 0);
          expect(loadMoreCalls, 0);
        },
      );

      testWidgets(
        'should not call loadMore when user scrolls '
        'to last item but hasError is true',
        (tester) async {
          // arrange
          tester.setSmallDisplaySize();

          // act
          await tester.pumpAppWidget(
            BeersView(
              showSearchBar: false,
              beers: beers,
              hasError: true,
              canLoadMore: true,
              beersLimit: limit,
              reload: reload,
              loadMore: loadMore,
              onFavouriteChanged: (_, __) {},
            ),
          );

          final lastItemFinder = find.byWidgetPredicate(
            (widget) =>
                widget is IndexedSemantics && widget.index == beers.length - 1,
          );
          await tester.scrollUntilVisible(lastItemFinder, 200);

          // assert
          expect(reloadCalls, 0);
          expect(loadMoreCalls, 0);
        },
      );

      testWidgets(
        'should call loadMore when widget is updated with new beers '
        'and scroll position is almost at the bottom',
        (tester) async {
          // arrange
          tester.setSmallDisplaySize();

          // act
          await tester.pumpAppWidget(
            WidgetSwitcher(
              builder: (context, toggle) {
                return BeersView(
                  showSearchBar: false,
                  beers: beers + (toggle ? beers : []),
                  hasError: false,
                  canLoadMore: true,
                  beersLimit: limit,
                  reload: reload,
                  loadMore: loadMore,
                  onFavouriteChanged: (_, __) {},
                );
              },
            ),
          );

          final lastLoadingItemFinder = find.byWidgetPredicate(
            (widget) =>
                widget is IndexedSemantics &&
                widget.index == beers.length + limit - 1,
          );
          await tester.scrollUntilVisible(lastLoadingItemFinder, 200);

          // assert
          expect(reloadCalls, 0);
          expect(loadMoreCalls, greaterThan(0));
          final lastCalls = loadMoreCalls;

          // act
          await WidgetSwitcher.toggle(tester);
          await tester.pump();

          // assert
          expect(reloadCalls, 0);
          expect(loadMoreCalls, greaterThan(lastCalls));
        },
      );
    },
  );
}
