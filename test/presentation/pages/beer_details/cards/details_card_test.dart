import 'package:beer_app/presentation/pages/beer_details/cards/details_card.dart';
import 'package:beer_app/presentation/widgets/material_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'DetailsCard',
    () {
      testWidgets(
        'should show MaterialCard, title and child',
        (tester) async {
          // arrange
          const title = 'Title';
          const child = Text('Child');

          // act
          await tester.pumpAppWidget(
            const DetailsCard(
              title: title,
              child: child,
            ),
          );

          // assert
          expect(find.byType(MaterialCard), findsOneWidget);
          expect(find.text(title), findsOneWidget);
          expect(find.byWidget(child), findsOneWidget);
        },
      );
    },
  );
}
