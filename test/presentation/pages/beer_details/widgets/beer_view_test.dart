import 'package:beer_app/presentation/pages/beer_details/widgets/beer_app_bar.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_content.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerView',
    () {
      testWidgets(
        'should show BeerAppBar, BeerContent '
        'with correct parameters when device is small',
        (tester) async {
          // arrange
          tester.setSmallDisplaySize();

          // act
          await tester.pumpAppWidget(
            BeerView(
              beer: beer,
            ),
          );

          // assert
          final beerAppBar = tester.widget<BeerAppBar>(
            find.byType(BeerAppBar),
          );
          expect(beerAppBar.isSmall, true);

          final beerContent = tester.widget<BeerContent>(
            find.byType(BeerContent),
          );
          expect(beerContent.showDescription, true);
          expect(beerContent.crossAxisCount, 1);
        },
      );

      testWidgets(
        'should show BeerAppBar, BeerContent '
        'with correct parameters when device is medium',
        (tester) async {
          // arrange
          tester.setMediumDisplaySize();

          // act
          await tester.pumpAppWidget(
            BeerView(
              beer: beer,
            ),
          );

          // assert
          final beerAppBar = tester.widget<BeerAppBar>(
            find.byType(BeerAppBar),
          );
          expect(beerAppBar.isSmall, false);

          final beerContent = tester.widget<BeerContent>(
            find.byType(BeerContent),
          );
          expect(beerContent.showDescription, false);
          expect(beerContent.crossAxisCount, 2);
        },
      );

      testWidgets(
        'should show BeerAppBar, BeerContent '
        'with correct parameters when device is large',
        (tester) async {
          // arrange
          tester.setLargeDisplaySize();

          // act
          await tester.pumpAppWidget(
            BeerView(
              beer: beer,
            ),
          );

          // assert
          final beerAppBar = tester.widget<BeerAppBar>(
            find.byType(BeerAppBar),
          );
          expect(beerAppBar.isSmall, false);

          final beerContent = tester.widget<BeerContent>(
            find.byType(BeerContent),
          );
          expect(beerContent.showDescription, false);
          expect(beerContent.crossAxisCount, 3);
        },
      );
    },
  );
}
