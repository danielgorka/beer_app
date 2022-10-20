import 'package:beer_app/presentation/assets.dart';
import 'package:beer_app/presentation/widgets/beer_loading.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rive/rive.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerLoading',
    () {
      testWidgets(
        'should show RiveAnimation',
        (tester) async {
          // act
          await tester.pumpAppWidget(const BeerLoading());

          // assert
          final finder = find.byType(RiveAnimation);
          final riveAnimation = tester.widget<RiveAnimation>(finder);
          expect(riveAnimation.name, Assets.beerLoading);
        },
      );
    },
  );
}
