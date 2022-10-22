import 'package:beer_app/presentation/assets.dart';
import 'package:beer_app/presentation/pages/beers/widgets/favourite_beer_button.dart';
import 'package:beer_app/presentation/widgets/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:like_button/like_button.dart';

import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'FavouriteBeerButton',
    () {
      testWidgets(
        'should show DecoratedBox and LikeButton',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const FavouriteBeerButton(
              favourite: false,
            ),
          );

          // assert
          expect(find.byType(DecoratedBox), findsOneWidget);
          expect(find.byType(LikeButton), findsOneWidget);
        },
      );

      testWidgets(
        'should show Assets.favMug when beer is not favourite',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const FavouriteBeerButton(
              favourite: false,
            ),
          );

          // assert
          final finder = find.byType(AssetIcon);
          final assetIcon = tester.widget<AssetIcon>(finder);
          expect(assetIcon.asset, Assets.favMug);
        },
      );

      testWidgets(
        'should show Assets.favMugColored when beer is favourite',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const FavouriteBeerButton(
              favourite: true,
            ),
          );

          // assert
          final finder = find.byType(AssetIcon);
          final assetIcon = tester.widget<AssetIcon>(finder);
          expect(assetIcon.asset, Assets.favMugColored);
        },
      );
    },
  );
}
