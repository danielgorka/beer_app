import 'package:beer_app/presentation/pages/beers/widgets/beer_placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerPlaceholder',
    () {
      testWidgets(
        'should show SvgPicture',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const BeerPlaceholder(),
          );

          // assert
          expect(find.byType(SvgPicture), findsOneWidget);
        },
      );
    },
  );
}
