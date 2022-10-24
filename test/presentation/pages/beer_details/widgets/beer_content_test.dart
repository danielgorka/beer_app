import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/food_pairing_card.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/specification_card.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerContent',
    () {
      testWidgets(
        'should show description, first brewed, SpecificationCard and '
        'FoodPairingCard when showDescription is true',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            CustomScrollView(
              slivers: [
                BeerContent(
                  showDescription: true,
                  crossAxisCount: 2,
                  beer: beer,
                ),
              ],
            ),
          );

          // assert
          expect(find.text(beer.description.value), findsOneWidget);
          final context = tester.element(find.byType(BeerContent));
          expect(
            find.text(
              context.l10n.firstBrewed(beer.firstBrewed.stringValue),
            ),
            findsOneWidget,
          );
          expect(find.byType(SpecificationCard), findsOneWidget);
          expect(find.byType(FoodPairingCard), findsOneWidget);
        },
      );

      testWidgets(
        'should show SpecificationCard and FoodPairingCard '
        'when showDescription is false',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            CustomScrollView(
              slivers: [
                BeerContent(
                  showDescription: false,
                  crossAxisCount: 2,
                  beer: beer,
                ),
              ],
            ),
          );

          // assert
          expect(find.text(beer.description.value), findsNothing);
          expect(find.text(beer.firstBrewed.stringValue), findsNothing);
          expect(find.byType(SpecificationCard), findsOneWidget);
          expect(find.byType(FoodPairingCard), findsOneWidget);
        },
      );
    },
  );
}
