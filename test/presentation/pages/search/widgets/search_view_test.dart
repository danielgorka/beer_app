import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/app_icons.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beers_view.dart';
import 'package:beer_app/presentation/pages/search/widgets/search_view.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mock_values/beer.dart';
import '../../../../utils/mockables.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'SearchView',
    () {
      const limit = 10;
      final beers = [beer];

      late SearchBloc searchBloc;

      setUp(() {
        searchBloc = MockSearchBloc();
      });

      Future<void> pumpWidget(WidgetTester tester) async {
        await tester.pumpAppWidget(
          BlocProvider.value(
            value: searchBloc,
            child: const SearchView(),
          ),
        );
      }

      testWidgets(
        'should show ErrorView when beers is null and has error',
        (tester) async {
          // arrange
          when(() => searchBloc.state).thenReturn(
            const SearchState(
              loading: false,
              isSubmitted: false,
              errorType: ErrorType.unknown,
              query: '',
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await pumpWidget(tester);

          // assert
          expect(find.byType(ErrorView), findsOneWidget);
        },
      );

      testWidgets(
        'should add SearchEvent.init on try again button pressed',
        (tester) async {
          // arrange
          when(() => searchBloc.state).thenReturn(
            const SearchState(
              loading: false,
              isSubmitted: false,
              errorType: ErrorType.unknown,
              query: '',
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await pumpWidget(tester);

          final context = tester.element(find.byType(ErrorView));
          await tester.tap(find.text(context.l10n.tryAgain));

          // assert
          verify(() => searchBloc.add(const SearchEvent.init())).called(1);
        },
      );

      testWidgets(
        'should show AppIcons.search when isSubmitted is false',
        (tester) async {
          // arrange
          when(() => searchBloc.state).thenReturn(
            const SearchState(
              loading: false,
              isSubmitted: false,
              errorType: ErrorType.none,
              query: '',
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await pumpWidget(tester);

          // assert
          expect(find.byIcon(AppIcons.search), findsOneWidget);
        },
      );

      testWidgets(
        'should show BeersView when isSubmitted is true',
        (tester) async {
          // arrange
          when(() => searchBloc.limit).thenReturn(limit);
          when(() => searchBloc.state).thenReturn(
            SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: '',
              beers: beers,
              canLoadMore: true,
            ),
          );

          // act
          await pumpWidget(tester);

          // assert
          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          expect(beersView.beers, beers);
          expect(beersView.hasError, false);
          expect(beersView.canLoadMore, true);
          expect(beersView.beersLimit, limit);
          expect(find.byType(BeersView), findsOneWidget);
        },
      );

      testWidgets(
        'should add SearchEvent.loadMore '
        'when BeersView.loadMore is called',
        (tester) async {
          // arrange
          when(() => searchBloc.limit).thenReturn(limit);
          when(() => searchBloc.state).thenReturn(
            const SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: '',
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await pumpWidget(tester);

          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          beersView.loadMore!.call();

          // assert
          verify(() => searchBloc.add(const SearchEvent.loadMore())).called(1);
        },
      );

      testWidgets(
        'should add SearchEvent.submitted '
        'when BeersView.reload is called',
        (tester) async {
          // arrange
          const query = 'query';
          when(() => searchBloc.limit).thenReturn(limit);
          when(() => searchBloc.state).thenReturn(
            const SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: query,
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await pumpWidget(tester);

          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          beersView.reload();

          // assert
          verify(() => searchBloc.add(const SearchEvent.submitted(query)))
              .called(1);
        },
      );

      testWidgets(
        'should add SearchEvent.favouriteChanged '
        'when BeersView.onFavouriteChanged is called',
        (tester) async {
          // arrange
          when(() => searchBloc.limit).thenReturn(limit);
          when(() => searchBloc.state).thenReturn(
            const SearchState(
              loading: false,
              isSubmitted: true,
              errorType: ErrorType.none,
              query: '',
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await pumpWidget(tester);

          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          beersView.onFavouriteChanged(beer, true);

          // assert
          verify(
            () => searchBloc.add(
              SearchEvent.favouriteChanged(beer: beer, favourite: true),
            ),
          ).called(1);
        },
      );
    },
  );
}
