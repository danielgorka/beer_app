import 'package:beer_app/presentation/pages/beers/widgets/beer_image_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item.dart';
import 'package:beer_app/presentation/pages/beers/widgets/favourite_beer_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerItem',
    () {
      testWidgets(
        'should show BeerImageView',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeerItem(
              beer: beer,
            ),
          );

          // assert
          expect(find.byType(BeerImageView), findsOneWidget);
        },
      );

      testWidgets(
        'should show beer name',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeerItem(
              beer: beer,
            ),
          );

          // assert
          expect(find.text('${beer.name.value}\n\n'), findsOneWidget);
        },
      );

      testWidgets(
        'should show FavouriteBeerButton',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeerItem(
              beer: beer,
            ),
          );

          // assert
          expect(find.byType(FavouriteBeerButton), findsOneWidget);
        },
      );
    },
  );
}
