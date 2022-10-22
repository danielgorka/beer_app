import 'package:beer_app/presentation/pages/beers/widgets/beer_item_placeholder.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_placeholder.dart';
import 'package:beer_app/presentation/widgets/text_placeholder.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerItemPlaceholder',
    () {
      testWidgets(
        'should show BeerPlaceholder',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const BeerItemPlaceholder(),
          );

          // assert
          expect(find.byType(BeerPlaceholder), findsOneWidget);
        },
      );

      testWidgets(
        'should show TextPlaceholder',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const BeerItemPlaceholder(),
          );

          // assert
          expect(find.byType(TextPlaceholder), findsOneWidget);
        },
      );
    },
  );
}
