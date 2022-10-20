import 'package:beer_app/presentation/widgets/beer_loading.dart';
import 'package:beer_app/presentation/widgets/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'LoadingView',
    () {
      testWidgets(
        'should show child wrapped with AnimatedOpacity with value 0.0 '
        'and BeerLoading when loading is true',
        (tester) async {
          // arrange
          const child = Text('Child');

          // act
          await tester.pumpAppWidget(
            const LoadingView(
              loading: true,
              child: child,
            ),
          );

          // assert
          final finder = find.ancestor(
            of: find.byWidget(child),
            matching: find.byType(AnimatedOpacity),
          );
          final animatedOpacity = tester.widget<AnimatedOpacity>(finder);
          expect(animatedOpacity.opacity, 0.0);
          expect(find.byType(BeerLoading), findsOneWidget);
        },
      );

      testWidgets(
        'should show child wrapped with AnimatedOpacity with value 1.0 '
        'and should not show AppCircularProgressIndicator '
        'when loading is false',
        (tester) async {
          // arrange
          const child = Text('Child');

          // act
          await tester.pumpAppWidget(
            const LoadingView(
              loading: false,
              child: child,
            ),
          );

          // assert
          final finder = find.ancestor(
            of: find.byWidget(child),
            matching: find.byType(AnimatedOpacity),
          );
          final animatedOpacity = tester.widget<AnimatedOpacity>(finder);
          expect(animatedOpacity.opacity, 1.0);
          expect(find.byType(BeerLoading), findsNothing);
        },
      );
    },
  );
}
