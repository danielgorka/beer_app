import 'package:beer_app/presentation/pages/beers/utils.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item_placeholder.dart';
import 'package:beer_app/presentation/pages/beers/widgets/loading_beers_view.dart';
import 'package:beer_app/presentation/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'LoadingBeersView',
    () {
      testWidgets(
        'should show AppShimmer',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const LoadingBeersView(),
          );

          // assert
          expect(find.byType(AppShimmer), findsOneWidget);
        },
      );

      testWidgets(
        'should show GridView with disabled scroll',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const LoadingBeersView(),
          );

          // assert
          final finder = find.byType(GridView);
          final gridView = tester.widget<GridView>(finder);
          expect(gridView.physics, const NeverScrollableScrollPhysics());
          expect(gridView.padding, beersViewPadding);
          expect(gridView.gridDelegate, beersGridViewDelegate);
        },
      );

      testWidgets(
        'should show multiple BeerItemPlaceholders',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const LoadingBeersView(),
          );

          // assert
          expect(find.byType(BeerItemPlaceholder), findsWidgets);
        },
      );
    },
  );
}
