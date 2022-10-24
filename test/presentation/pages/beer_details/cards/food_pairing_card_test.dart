import 'package:beer_app/domain/beers/value_objects/beer_food.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/details_card.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/food_pairing_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'FoodPairingCard',
    () {
      testWidgets(
        'should show DetailsCard, foodPairing title and all food pairs',
        (tester) async {
          // arrange
          final foodPairing = [
            const BeerFood('Food 1'),
            const BeerFood('Food 2'),
          ];
          const text = '•  Food 1\n•  Food 2';

          // act
          await tester.pumpAppWidget(
            FoodPairingCard(
              beer: beer.copyWith(
                foodPairing: foodPairing,
              ),
            ),
          );

          // assert
          expect(find.byType(DetailsCard), findsOneWidget);
          final context = tester.element(find.byType(FoodPairingCard));
          expect(find.text(context.l10n.foodPairing), findsOneWidget);
          expect(find.text(text), findsOneWidget);
        },
      );
    },
  );
}
