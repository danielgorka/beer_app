import 'package:beer_app/presentation/utils.dart';
import 'package:beer_app/presentation/widgets/text_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'TextPlaceholder',
    () {
      testWidgets(
        'should Container has border radius, width and height',
        (tester) async {
          // arrange
          const width = 1.0;
          const height = 2.0;

          // act
          await tester.pumpAppWidget(
            const TextPlaceholder(
              width: width,
              height: height,
            ),
          );

          // assert
          final finder = find.byType(Container);
          final container = tester.widget<Container>(finder);
          expect(container.constraints!.minWidth, width);
          expect(container.constraints!.minHeight, height);

          final boxDecoration = container.decoration! as BoxDecoration;
          expect(boxDecoration.borderRadius, borderRadius);
        },
      );
    },
  );
}
