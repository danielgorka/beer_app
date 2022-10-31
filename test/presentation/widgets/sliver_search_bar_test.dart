import 'package:beer_app/presentation/app_icons.dart';
import 'package:beer_app/presentation/widgets/animated_fade_scale.dart';
import 'package:beer_app/presentation/widgets/material_card.dart';
import 'package:beer_app/presentation/widgets/sliver_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_container/open_container.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'SliverSearchBar',
    () {
      const title = 'Title';

      var calls = 0;
      void onTap() {
        calls++;
      }

      setUp(() {
        calls = 0;
      });

      Future<void> pumpWidget(WidgetTester tester) async {
        await tester.pumpAppWidget(
          CustomScrollView(
            slivers: [
              SliverSearchBar(
                title: title,
                onTap: onTap,
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 1000,
                ),
              ),
            ],
          ),
        );
      }

      testWidgets(
        'should show OpenContainer, MaterialCard, search icon and title',
        (tester) async {
          // act
          await pumpWidget(tester);

          // assert
          expect(find.byType(OpenContainer), findsOneWidget);
          expect(find.byType(MaterialCard), findsOneWidget);
          expect(find.byIcon(AppIcons.search), findsOneWidget);
          expect(find.text(title), findsOneWidget);
        },
      );

      testWidgets(
        'should call onTap on tap',
        (tester) async {
          // act
          await pumpWidget(tester);

          await tester.tap(find.byType(MaterialCard));

          // assert
          expect(calls, 1);
        },
      );

      testWidgets(
        'should hide widget on scroll down and show on scroll up',
        (tester) async {
          // act
          await pumpWidget(tester);

          await tester.drag(find.byType(Scrollable), const Offset(0, -10));
          await tester.pumpAndSettle();

          // assert
          final finder = find.ancestor(
            of: find.byType(MaterialCard),
            matching: find.byType(AnimatedFadeScale),
          );
          final animatedFadeScale = tester.widget<AnimatedFadeScale>(finder);
          expect(animatedFadeScale.visible, false);

          // act
          await tester.drag(find.byType(Scrollable), const Offset(0, 1));
          await tester.pumpAndSettle();

          // assert
          final animatedFadeScale2 = tester.widget<AnimatedFadeScale>(finder);
          expect(animatedFadeScale2.visible, true);
        },
      );
    },
  );
}
