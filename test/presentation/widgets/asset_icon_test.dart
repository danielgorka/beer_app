import 'package:beer_app/presentation/assets.dart';
import 'package:beer_app/presentation/widgets/asset_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'AssetIcon',
    () {
      testWidgets(
        'should show SvgPicture.asset with size and color from icon theme',
        (tester) async {
          // arrange
          const asset = Assets.favMug;
          const iconTheme = IconThemeData(
            size: 20,
            color: Colors.red,
          );

          // act
          await tester.pumpAppWidget(
            const IconTheme(
              data: iconTheme,
              child: AssetIcon(asset),
            ),
          );

          // assert
          final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
          final exactAssetPicture =
              svgPicture.pictureProvider as ExactAssetPicture;
          expect(exactAssetPicture.assetName, asset);
          expect(svgPicture.width, iconTheme.size);
          expect(
            svgPicture.colorFilter,
            ColorFilter.mode(iconTheme.color!, BlendMode.srcIn),
          );
        },
      );
    },
  );
}
