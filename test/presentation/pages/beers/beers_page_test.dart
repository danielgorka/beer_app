import 'package:beer_app/application/beers/beers_bloc.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beers/beers_page.dart';
import 'package:beer_app/presentation/pages/beers/widgets/beers_view.dart';
import 'package:beer_app/presentation/pages/beers/widgets/loading_beers_view.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mock_values/beer.dart';
import '../../../utils/mockables.dart';
import '../../../utils/widget_tester_ext.dart';

typedef BeersBlocProvider = BlocProvider<BeersBloc>;

void main() {
  group(
    'BeersPage',
    () {
      const limit = 10;
      final beers = [beer];

      late BeersBloc beersBloc;

      setUp(() {
        beersBloc = MockBeersBloc();
        GetIt.instance.registerSingleton(beersBloc);
      });

      tearDown(() {
        GetIt.instance.reset();
      });

      testWidgets(
        'should show BeersBlocProvider and add BeersEvent.init on create',
        (tester) async {
          // arrange
          when(() => beersBloc.state).thenReturn(BeersState.initial());

          // act
          await tester.pumpAppWidget(
            const BeersPage(),
          );

          // assert
          expect(find.byType(BeersBlocProvider), findsOneWidget);
          verify(() => beersBloc.add(const BeersEvent.init())).called(1);
        },
      );

      testWidgets(
        'should show ErrorView when beers is null and has error',
        (tester) async {
          // arrange
          when(() => beersBloc.state).thenReturn(
            const BeersState(
              loading: false,
              errorType: ErrorType.unknown,
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const BeersPage(),
          );

          // assert
          expect(find.byType(ErrorView), findsOneWidget);
        },
      );

      testWidgets(
        'should add BeersEvent.init on try again button pressed',
        (tester) async {
          // arrange
          when(() => beersBloc.state).thenReturn(
            const BeersState(
              loading: false,
              errorType: ErrorType.unknown,
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const BeersPage(),
          );

          final context = tester.element(find.byType(ErrorView));
          await tester.tap(find.text(context.l10n.tryAgain));

          // assert
          verify(() => beersBloc.add(const BeersEvent.init())).called(2);
        },
      );

      testWidgets(
        'should show LoadingBeersView when beers is null',
        (tester) async {
          // arrange
          when(() => beersBloc.state).thenReturn(
            const BeersState(
              loading: true,
              errorType: ErrorType.none,
              beers: null,
              canLoadMore: true,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const BeersPage(),
          );

          // assert
          expect(find.byType(LoadingBeersView), findsOneWidget);
        },
      );

      testWidgets(
        'should show BeersView when beers is not null',
        (tester) async {
          // arrange
          when(() => beersBloc.limit).thenReturn(limit);
          when(() => beersBloc.state).thenReturn(
            BeersState(
              loading: true,
              errorType: ErrorType.network,
              beers: beers,
              canLoadMore: true,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const BeersPage(),
          );

          // assert
          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          expect(beersView.beers, beers);
          expect(beersView.hasError, true);
          expect(beersView.canLoadMore, true);
          expect(beersView.beersLimit, limit);
        },
      );

      testWidgets(
        'should add BeersEvent.loadMore '
        'when BeersView.loadMore is called',
        (tester) async {
          // arrange
          when(() => beersBloc.limit).thenReturn(limit);
          when(() => beersBloc.state).thenReturn(
            BeersState(
              loading: true,
              errorType: ErrorType.network,
              beers: beers,
              canLoadMore: true,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const BeersPage(),
          );

          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          beersView.loadMore();

          // assert
          verify(() => beersBloc.add(const BeersEvent.loadMore())).called(1);
        },
      );

      testWidgets(
        'should add BeersEvent.init '
        'when BeersView.reload is called',
        (tester) async {
          // arrange
          when(() => beersBloc.limit).thenReturn(limit);
          when(() => beersBloc.state).thenReturn(
            BeersState(
              loading: true,
              errorType: ErrorType.network,
              beers: beers,
              canLoadMore: true,
            ),
          );

          // act
          await tester.pumpAppWidget(
            const BeersPage(),
          );

          final finder = find.byType(BeersView);
          final beersView = tester.widget<BeersView>(finder);
          beersView.reload();

          // assert
          verify(() => beersBloc.add(const BeersEvent.init())).called(2);
        },
      );
    },
  );
}
