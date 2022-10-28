import 'package:beer_app/application/favourites/favourites_bloc.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beers_view.dart';
import 'package:beer_app/presentation/pages/favourites/favourites_page.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mock_values/beer.dart';
import '../../../utils/mockables.dart';
import '../../../utils/widget_tester_ext.dart';

typedef FavouritesBlocProvider = BlocProvider<FavouritesBloc>;

void main() {
  group(
    'FavouritesPage',
    () {
      final beers = [beer];

      late FavouritesBloc favouritesBloc;

      setUp(() {
        favouritesBloc = MockFavouritesBloc();
        GetIt.instance.registerSingleton(favouritesBloc);
      });

      tearDown(() {
        GetIt.instance.reset();
      });

      testWidgets(
        'should show FavouritesBlocProvider and '
        'add FavouritesEvent.init on create',
        (tester) async {
          // arrange
          when(() => favouritesBloc.state)
              .thenReturn(FavouritesState.initial());

          // act
          await tester.pumpAppWidget(
            const FavouritesPage(),
          );

          // assert
          expect(find.byType(FavouritesBlocProvider), findsOneWidget);
          verify(() => favouritesBloc.add(const FavouritesEvent.init()))
              .called(1);
        },
      );

      testWidgets(
        'should show ErrorView when beers is null and has error',
        (tester) async {
          // arrange
          when(() => favouritesBloc.state).thenReturn(
            const FavouritesState(
              loading: false,
              hasError: true,
              beers: null,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const FavouritesPage(),
          );

          // assert
          expect(find.byType(ErrorView), findsOneWidget);
        },
      );

      testWidgets(
        'should add FavouritesEvent.init on try again button pressed',
        (tester) async {
          // arrange
          when(() => favouritesBloc.state).thenReturn(
            const FavouritesState(
              loading: false,
              hasError: true,
              beers: null,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const FavouritesPage(),
          );

          final context = tester.element(find.byType(ErrorView));
          await tester.tap(find.text(context.l10n.tryAgain));

          // assert
          verify(() => favouritesBloc.add(const FavouritesEvent.init()))
              .called(2);
        },
      );

      testWidgets(
        'should show BeersView when beers is null',
        (tester) async {
          // arrange
          when(() => favouritesBloc.state).thenReturn(
            const FavouritesState(
              loading: true,
              hasError: false,
              beers: null,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const FavouritesPage(),
          );

          // assert
          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          expect(beersView.beers, null);
          expect(beersView.hasError, false);
          expect(beersView.canLoadMore, false);
          expect(beersView.beersLimit, null);
        },
      );

      testWidgets(
        'should show BeersView when beers is not null',
        (tester) async {
          // arrange
          when(() => favouritesBloc.state).thenReturn(
            FavouritesState(
              loading: true,
              hasError: true,
              beers: beers,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const FavouritesPage(),
          );

          // assert
          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          expect(beersView.beers, beers);
          expect(beersView.hasError, true);
          expect(beersView.canLoadMore, false);
          expect(beersView.beersLimit, null);
        },
      );

      testWidgets(
        'should add FavouritesEvent.init '
        'when BeersView.reload is called',
        (tester) async {
          // arrange
          when(() => favouritesBloc.state).thenReturn(
            FavouritesState(
              loading: true,
              hasError: true,
              beers: beers,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const FavouritesPage(),
          );

          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          beersView.reload();

          // assert
          verify(() => favouritesBloc.add(const FavouritesEvent.init()))
              .called(2);
        },
      );

      testWidgets(
        'should add FavouritesEvent.favouriteChanged '
        'when BeersView.onFavouriteChanged is called',
        (tester) async {
          // arrange
          when(() => favouritesBloc.state).thenReturn(
            FavouritesState(
              loading: true,
              hasError: true,
              beers: beers,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const FavouritesPage(),
          );

          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          beersView.onFavouriteChanged(beer, true);

          // assert
          verify(
            () => favouritesBloc.add(
              FavouritesEvent.favouriteChanged(beer: beer, favourite: true),
            ),
          ).called(1);
        },
      );
    },
  );
}
