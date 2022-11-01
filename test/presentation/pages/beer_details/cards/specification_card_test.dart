import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/details_card.dart';
import 'package:beer_app/presentation/pages/beer_details/cards/specification_card.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/specification_tile.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'SpecificationCard',
    () {
      testWidgets(
        'should show DetailsCard, specification title and 7 SpecificationTiles',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          expect(find.byType(DetailsCard), findsOneWidget);
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.specification), findsOneWidget);
          expect(find.byType(SpecificationTile), findsNWidgets(7));
        },
      );

      testWidgets(
        'should show SpecificationTile for ABV',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.abv), findsOneWidget);
          expect(find.text('${beer.abv.value}%'), findsOneWidget);
        },
      );

      testWidgets(
        'should show SpecificationTile for IBU',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.ibu), findsOneWidget);
          expect(find.text('${beer.ibu!.value}'), findsOneWidget);
        },
      );

      testWidgets(
        'should show SpecificationTile for EBC',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.ebc), findsOneWidget);
          expect(find.text('${beer.ebc!.value}'), findsOneWidget);
        },
      );
      testWidgets(
        'should show SpecificationTile for SRM',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.srm), findsOneWidget);
          expect(find.text('${beer.srm!.value}'), findsOneWidget);
        },
      );

      testWidgets(
        'should show SpecificationTile for pH',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.ph), findsOneWidget);
          expect(find.text('${beer.ph!.value}'), findsOneWidget);
        },
      );

      testWidgets(
        'should show SpecificationTile for OG',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.og), findsOneWidget);
          expect(find.text('${beer.targetOg!.value}'), findsOneWidget);
        },
      );

      testWidgets(
        'should show SpecificationTile for FG',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            SpecificationCard(
              beer: beer,
            ),
          );

          // assert
          final context = tester.element(find.byType(SpecificationCard));
          expect(find.text(context.l10n.fg), findsOneWidget);
          expect(find.text('${beer.targetFg!.value}'), findsOneWidget);
        },
      );
    },
  );
}
