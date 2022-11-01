import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/details_card.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/ingredients_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mock_values/beer_ingredient_hop.dart';
import '../../../../utils/mock_values/beer_ingredient_malt.dart';
import '../../../../utils/mock_values/beer_ingredients.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'IngredientsCard',
    () {
      testWidgets(
        'should show DetailsCard and ingredients title',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            IngredientsCard(
              ingredients: beerIngredients,
            ),
          );

          // assert
          expect(find.byType(DetailsCard), findsOneWidget);
          final context = tester.element(find.byType(IngredientsCard));
          expect(find.text(context.l10n.ingredients), findsOneWidget);
        },
      );

      testWidgets(
        'should show malt ingredients',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            IngredientsCard(
              ingredients: beerIngredients,
            ),
          );

          // assert
          expect(
            find.text(
              '•  ${beerMaltName.value} (${beerMaltAmount.valueString})',
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should show hops ingredients',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            IngredientsCard(
              ingredients: beerIngredients,
            ),
          );

          // assert
          expect(
            find.text(
              '•  ${beerHopName.value} (${beerHopAmount.valueString})',
            ),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'should show yeast ingredient',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            IngredientsCard(
              ingredients: beerIngredients,
            ),
          );

          // assert
          expect(
            find.text('•  ${beerIngredientsYeast.value}'),
            findsOneWidget,
          );
        },
      );
    },
  );
}
