import 'dart:async';

import 'package:beer_app/presentation/pages/beers/widgets/beer_image_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_placeholder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/mockables.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerImage',
    () {
      late CacheManager cacheManager;

      setUp(() {
        cacheManager = MockCacheManager();
        when(() => cacheManager.getSingleFile(beerImageUrl.value))
            .thenAnswer((_) => Completer<File>().future);
      });

      testWidgets(
        'should show CachedNetworkImage',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeerImageView(
              imageUrl: beerImageUrl,
              cacheManager: cacheManager,
            ),
          );
          await tester.pump();

          // assert
          expect(find.byType(CachedNetworkImage), findsOneWidget);
        },
      );

      testWidgets(
        'should show BeerPlaceholder when loading image',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeerImageView(
              imageUrl: beerImageUrl,
              cacheManager: cacheManager,
            ),
          );
          await tester.pump();

          // assert
          expect(find.byType(BeerPlaceholder), findsOneWidget);
        },
      );

      testWidgets(
        'should show BeerPlaceholder when error occurred while loading image',
        (tester) async {
          // arrange
          when(() => cacheManager.getSingleFile(beerImageUrl.value))
              .thenThrow(Exception());

          // act
          await tester.pumpAppWidget(
            BeerImageView(
              imageUrl: beerImageUrl,
              cacheManager: cacheManager,
            ),
          );
          await tester.pump();

          // assert
          expect(find.byType(BeerPlaceholder), findsOneWidget);
        },
      );
    },
  );
}
