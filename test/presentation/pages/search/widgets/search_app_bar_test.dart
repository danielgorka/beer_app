import 'package:beer_app/application/search/search_bloc.dart';
import 'package:beer_app/presentation/pages/search/widgets/search_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mockables.dart';
import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'SearchAppBar',
    () {
      late SearchBloc searchBloc;

      setUp(() {
        searchBloc = MockSearchBloc();
      });

      Future<void> pumpWidget(WidgetTester tester) async {
        await tester.pumpAppWidget(
          BlocProvider.value(
            value: searchBloc,
            child: const SearchAppBar(),
          ),
        );
      }

      group(
        'preferredSize',
        () {
          test(
            'should return Size.fromHeight(kToolbarHeight)',
            () {
              // act
              final result = const SearchAppBar().preferredSize;

              // assert
              expect(result, const Size.fromHeight(kToolbarHeight));
            },
          );
        },
      );

      testWidgets(
        'should show AppBar and TextField',
        (tester) async {
          // act
          await pumpWidget(tester);

          // assert
          expect(find.byType(AppBar), findsOneWidget);
          expect(find.byType(TextField), findsOneWidget);
        },
      );

      testWidgets(
        'should show AppBar and focused TextField',
        (tester) async {
          // act
          await pumpWidget(tester);

          // assert
          expect(find.byType(AppBar), findsOneWidget);
          final textField = tester.widget<TextField>(find.byType(TextField));
          expect(textField.focusNode!.hasPrimaryFocus, true);
          verify(() => searchBloc.add(const SearchEvent.editQuery())).called(1);
        },
      );

      testWidgets(
        'should add SearchEvent.editQuery when TextField gets focus',
        (tester) async {
          // act
          await pumpWidget(tester);

          // assert
          verify(() => searchBloc.add(const SearchEvent.editQuery())).called(1);

          // act
          FocusScope.of(tester.element(find.byType(TextField))).unfocus();
          await tester.pumpAndSettle();
          FocusScope.of(tester.element(find.byType(TextField))).requestFocus();
          await tester.pumpAndSettle();

          // assert
          verify(() => searchBloc.add(const SearchEvent.editQuery())).called(1);
        },
      );

      testWidgets(
        'should add SearchEvent.queryChanged on TextField text changed',
        (tester) async {
          // arrange
          const query = 'query';

          // act
          await pumpWidget(tester);

          final finder = find.byType(TextField);
          await tester.enterText(finder, query);

          // assert
          verify(() => searchBloc.add(const SearchEvent.queryChanged(query)))
              .called(1);
        },
      );

      testWidgets(
        'should add SearchEvent.submitted on TextField submitted',
        (tester) async {
          // arrange
          const query = 'query';

          // act
          await pumpWidget(tester);

          final finder = find.byType(TextField);
          await tester.enterText(finder, query);
          await tester.testTextInput.receiveAction(TextInputAction.search);

          // assert
          verify(() => searchBloc.add(const SearchEvent.submitted(query)))
              .called(1);
        },
      );
    },
  );
}
