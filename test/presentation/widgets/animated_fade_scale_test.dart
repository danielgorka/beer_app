import 'package:animations/animations.dart';
import 'package:beer_app/presentation/widgets/animated_fade_scale.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_switcher.dart';
import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'AnimatedFadeScale',
    () {
      testWidgets(
        'should animate child using FadeScaleTransition',
        (WidgetTester tester) async {
          // arrange
          const duration = Duration(milliseconds: 300);

          // act
          await tester.pumpAppWidget(
            WidgetSwitcher(
              builder: (context, toggle) {
                return AnimatedFadeScale(
                  duration: duration,
                  visible: toggle,
                );
              },
            ),
          );

          // assert
          final finder = find.byType(FadeScaleTransition);
          final fadeScaleTransition =
              tester.widget<FadeScaleTransition>(finder);
          expect(fadeScaleTransition.animation.value, 0.0);

          // act
          await WidgetSwitcher.toggle(tester);

          await tester.pump();
          await tester.pump(duration);

          // assert
          final fadeScaleTransition2 =
              tester.widget<FadeScaleTransition>(finder);
          expect(fadeScaleTransition2.animation.value, 1.0);
        },
      );
    },
  );
}
