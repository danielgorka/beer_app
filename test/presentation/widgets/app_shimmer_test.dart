import 'package:beer_app/presentation/widgets/app_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'AppShimmer',
    () {
      testWidgets(
        'should return Shimmer with light gray when dark mode in off',
        (tester) async {
          // arrange
          tester.setBrightness(Brightness.light);

          // act
          await tester.pumpAppWidget(AppShimmer(child: Container()));

          // assert
          final finder = find.byType(Shimmer);
          final shimmer = tester.widget<Shimmer>(finder);
          final gradient = shimmer.gradient as LinearGradient;
          expect(gradient.colors.first, Colors.grey[300]);
          expect(gradient.colors[2], Colors.grey[100]);
        },
      );

      testWidgets(
        'should return Shimmer with dark gray when dark mode in on',
        (tester) async {
          // arrange
          tester.setBrightness(Brightness.dark);

          // act
          await tester.pumpAppWidget(AppShimmer(child: Container()));

          // assert
          final finder = find.byType(Shimmer);
          final shimmer = tester.widget<Shimmer>(finder);
          final gradient = shimmer.gradient as LinearGradient;
          expect(gradient.colors.first, Colors.grey[600]);
          expect(gradient.colors[2], Colors.grey[500]);
        },
      );
    },
  );
}
