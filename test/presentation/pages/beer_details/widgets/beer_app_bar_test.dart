import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_app_bar.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_image_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/favourite_beer_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerAppBar',
    () {
      testWidgets(
        'should show SliverAppBar, FavouriteButton, BeerImageView and name '
        'when isSmall is true',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            CustomScrollView(
              slivers: [
                BeerAppBar(
                  isSmall: true,
                  beer: beer,
                ),
              ],
            ),
          );

          // assert
          expect(find.byType(SliverAppBar), findsOneWidget);
          expect(find.byType(FavouriteBeerButton), findsOneWidget);
          expect(find.byType(BeerImageView), findsOneWidget);
          expect(find.text(beer.name.value), findsOneWidget);
          expect(find.text(beer.description.value), findsNothing);

          final context = tester.element(find.byType(BeerAppBar));
          expect(
            find.text(
              context.l10n.firstBrewed(beer.firstBrewed.stringValue),
            ),
            findsNothing,
          );
        },
      );

      testWidgets(
        'should show SliverAppBar, FavouriteButton, BeerImageView, '
        'name, description and first brewed '
        'when isSmall is false',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            CustomScrollView(
              slivers: [
                BeerAppBar(
                  isSmall: false,
                  beer: beer,
                ),
              ],
            ),
          );

          // assert
          expect(find.byType(SliverAppBar), findsOneWidget);
          expect(find.byType(FavouriteBeerButton), findsOneWidget);
          expect(find.byType(BeerImageView), findsOneWidget);
          expect(find.text(beer.name.value), findsOneWidget);
          expect(find.text(beer.description.value), findsOneWidget);
          final context = tester.element(find.byType(BeerAppBar));
          expect(
            find.text(
              context.l10n.firstBrewed(beer.firstBrewed.stringValue),
            ),
            findsOneWidget,
          );
        },
      );
    },
  );
}
