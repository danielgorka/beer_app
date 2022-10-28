import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/presentation/pages/search/search_page.dart';
import 'package:beer_app/presentation/pages/search/widgets/search_app_bar.dart';
import 'package:beer_app/presentation/pages/search/widgets/search_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mockables.dart';
import '../../../utils/widget_tester_ext.dart';

typedef SearchBlocProvider = BlocProvider<SearchBloc>;

void main() {
  group(
    'SearchPage',
    () {
      const limit = 10;

      late SearchBloc searchBloc;

      setUp(() {
        searchBloc = MockSearchBloc();
        GetIt.instance.registerSingleton(searchBloc);
      });

      tearDown(() {
        GetIt.instance.reset();
      });

      testWidgets(
        'should show SearchBlocProvider and add SearchEvent.init on create',
        (tester) async {
          // arrange
          when(() => searchBloc.limit).thenReturn(limit);
          when(() => searchBloc.state).thenReturn(SearchState.initial());

          // act
          await tester.pumpAppWidget(
            const SearchPage(),
          );

          // assert
          expect(find.byType(SearchBlocProvider), findsOneWidget);
          verify(() => searchBloc.add(const SearchEvent.init())).called(1);
        },
      );

      testWidgets(
        'should show SearchAppBar and SearchView',
        (tester) async {
          // arrange
          when(() => searchBloc.limit).thenReturn(limit);
          when(() => searchBloc.state).thenReturn(SearchState.initial());

          // act
          await tester.pumpAppWidget(
            const SearchPage(),
          );

          // assert
          expect(find.byType(SearchAppBar), findsOneWidget);
          expect(find.byType(SearchView), findsOneWidget);
        },
      );
    },
  );
}
