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
          expect(svgPicture.height, iconTheme.size);
          expect(
            svgPicture.colorFilter,
            ColorFilter.mode(iconTheme.color!, BlendMode.srcIn),
          );
        },
      );

      testWidgets(
        'should show SvgPicture.asset with custom size and color',
        (tester) async {
          // arrange
          const asset = Assets.favMug;
          const size = 10.0;
          const color = Colors.red;

          // act
          await tester.pumpAppWidget(
            const AssetIcon(
              asset,
              size: size,
              color: color,
            ),
          );

          // assert
          final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
          final exactAssetPicture =
              svgPicture.pictureProvider as ExactAssetPicture;
          expect(exactAssetPicture.assetName, asset);
          expect(svgPicture.width, size);
          expect(svgPicture.height, size);
          expect(
            svgPicture.colorFilter,
            const ColorFilter.mode(color, BlendMode.srcIn),
          );
        },
      );

      testWidgets(
        'should show SvgPicture.asset with no color filter '
        'when isTwoTone is true',
        (tester) async {
          // arrange
          const asset = Assets.favMug;
          const iconTheme = IconThemeData(
            color: Colors.red,
          );

          // act
          await tester.pumpAppWidget(
            const IconTheme(
              data: iconTheme,
              child: AssetIcon(
                asset,
                isTwoTone: true,
              ),
            ),
          );

          // assert
          final svgPicture = tester.widget<SvgPicture>(find.byType(SvgPicture));
          expect(svgPicture.colorFilter, null);
        },
      );
    },
  );
}
