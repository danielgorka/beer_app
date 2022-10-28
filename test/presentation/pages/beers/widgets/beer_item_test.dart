import 'package:auto_route/auto_route.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_image_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beer_item.dart';
import 'package:beer_app/presentation/pages/beers/widgets/favourite_beer_button.dart';
import 'package:beer_app/presentation/routes/router.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/mockables.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'BeerItem',
    () {
      testWidgets(
        'should show BeerImageView',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeerItem(
              beer: beer,
              onFavouriteChanged: (_) {},
            ),
          );

          // assert
          expect(find.byType(BeerImageView), findsOneWidget);
        },
      );

      testWidgets(
        'should show beer name',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            BeerItem(
              beer: beer,
              onFavouriteChanged: (_) {},
            ),
          );

          // assert
          expect(find.text('${beer.name.value}\n\n'), findsOneWidget);
        },
      );

      testWidgets(
        'should show FavouriteBeerButton with onFavouriteChanged callback',
        (tester) async {
          // arrange
          void onFavouriteChanged(_) {}

          // act
          await tester.pumpAppWidget(
            BeerItem(
              beer: beer,
              onFavouriteChanged: onFavouriteChanged,
            ),
          );

          // assert
          final finder = find.byType(FavouriteBeerButton);
          final favouriteBeerButton =
              tester.widget<FavouriteBeerButton>(finder);
          expect(favouriteBeerButton.onFavouriteChanged, onFavouriteChanged);
        },
      );

      testWidgets(
        'should push BeerDetailsPage on tap',
        (tester) async {
          // arrange
          final mockAppRouter = MockAppRouter();
          final route = BeerDetailsRoute(
            beerId: beer.id.value,
          );

          when(() => mockAppRouter.push(route))
              .thenAnswer((_) => Future.value());

          // act
          await tester.pumpAppWidget(
            StackRouterScope(
              controller: mockAppRouter,
              stateHash: 0,
              child: BeerItem(
                beer: beer,
                onFavouriteChanged: (_) {},
              ),
            ),
          );

          await tester.tap(find.byType(BeerItem));
          await tester.pumpAndSettle();

          // assert
          verify(() => mockAppRouter.push(route)).called(1);
        },
      );
    },
  );
}
