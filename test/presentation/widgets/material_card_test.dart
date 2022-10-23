import 'package:beer_app/presentation/utils.dart';
import 'package:beer_app/presentation/widgets/material_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'MaterialCard',
    () {
      testWidgets(
        'should show Material with MaterialType.card, '
        'elevation, border radius, surfaceTintColor and child',
        (tester) async {
          // arrange
          final borderRadius = BorderRadius.circular(10);
          const child = Text('Child');

          // act
          await tester.pumpAppWidget(
            MaterialCard(
              elevation: ElevationLevel.level1,
              borderRadius: borderRadius,
              child: child,
            ),
          );

          // assert
          final finder = find.byType(Material).last;
          final context = tester.element(finder);
          final material = tester.widget<Material>(finder);
          expect(material.type, MaterialType.card);
          expect(material.borderRadius, borderRadius);
          expect(material.elevation, 1.0);
          expect(
            material.surfaceTintColor,
            Theme.of(context).colorScheme.primary,
          );
          expect(material.child, child);
        },
      );
    },
  );
}
