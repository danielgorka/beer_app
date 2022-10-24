import 'package:beer_app/application/beer_details/beer_details_bloc.dart';
import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/pages/beer_details/beer_details_page.dart';
import 'package:beer_app/presentation/pages/beer_details/widgets/beer_view.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:beer_app/presentation/widgets/loading_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mock_values/beer.dart';
import '../../../utils/mockables.dart';
import '../../../utils/widget_tester_ext.dart';

typedef BeerDetailsBlocProvider = BlocProvider<BeerDetailsBloc>;

void main() {
  group(
    'BeerDetailsPage',
    () {
      late BeerDetailsBloc beerDetailsBloc;

      setUp(() {
        beerDetailsBloc = MockBeerDetailsBloc();
        GetIt.instance.registerSingleton(beerDetailsBloc);
      });

      tearDown(() {
        GetIt.instance.reset();
      });

      testWidgets(
        'should show BeerDetailsBlocProvider and '
        'add BeerDetailsEvent.init on create',
        (tester) async {
          // arrange
          when(() => beerDetailsBloc.state)
              .thenReturn(BeerDetailsState.initial());

          // act
          await tester.pumpAppWidget(
            BeerDetailsPage(
              beerId: beer.id.value,
              beer: beer,
            ),
          );

          // assert
          expect(find.byType(BeerDetailsBlocProvider), findsOneWidget);
          verify(
            () => beerDetailsBloc.add(
              BeerDetailsEvent.init(
                beerId: beer.id.value,
                beer: beer,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'should show ErrorView when beer is null and has error',
        (tester) async {
          // arrange
          when(() => beerDetailsBloc.state).thenReturn(
            const BeerDetailsState(
              loading: false,
              errorType: ErrorType.unknown,
              beer: null,
            ),
          );

          // act
          await tester.pumpAppWidget(
            BeerDetailsPage(beerId: beer.id.value),
          );

          // assert
          expect(find.byType(ErrorView), findsOneWidget);
        },
      );

      testWidgets(
        'should add BeerDetailsEvent.init on try again button pressed',
        (tester) async {
          // arrange
          when(() => beerDetailsBloc.state).thenReturn(
            const BeerDetailsState(
              loading: false,
              errorType: ErrorType.unknown,
              beer: null,
            ),
          );

          // act
          await tester.pumpAppWidget(
            BeerDetailsPage(
              beerId: beer.id.value,
              beer: beer,
            ),
          );

          final context = tester.element(find.byType(ErrorView));
          await tester.tap(find.text(context.l10n.tryAgain));
          await tester.pumpAndSettle();

          // assert
          verify(
            () => beerDetailsBloc.add(
              BeerDetailsEvent.init(
                beerId: beer.id.value,
              ),
            ),
          ).called(1);
        },
      );

      testWidgets(
        'should show LoadingView with loading true when state is loading',
        (tester) async {
          // arrange
          when(() => beerDetailsBloc.state).thenReturn(
            const BeerDetailsState(
              loading: true,
              errorType: ErrorType.none,
              beer: null,
            ),
          );

          // act
          await tester.pumpAppWidget(
            BeerDetailsPage(
              beerId: beer.id.value,
            ),
          );

          // assert
          final finder = find.byType(LoadingView);
          final loadingView = tester.widget<LoadingView>(finder);
          expect(loadingView.loading, true);
        },
      );

      testWidgets(
        'should show BeerView when state is not loading and beer is not null',
        (tester) async {
          // arrange
          when(() => beerDetailsBloc.state).thenReturn(
            BeerDetailsState(
              loading: false,
              errorType: ErrorType.none,
              beer: beer,
            ),
          );

          // act
          await tester.pumpAppWidget(
            BeerDetailsPage(
              beerId: beer.id.value,
            ),
          );

          // assert
          expect(find.byType(BeerView), findsOneWidget);
        },
      );
    },
  );
}
