import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/widget_tester_ext.dart';

void main() {
  group(
    'ErrorView',
    () {
      testWidgets(
        'should show SvgPicture',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            ErrorView(
              onRefresh: () {},
            ),
          );

          // assert
          expect(find.byType(SvgPicture), findsOneWidget);
        },
      );

      testWidgets(
        'should show somethingWentWrong text when content is null',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            ErrorView(
              onRefresh: () {},
            ),
          );

          // assert
          final context = tester.element(find.byType(ErrorView));
          expect(find.text(context.l10n.somethingWentWrong), findsOneWidget);
        },
      );

      testWidgets(
        'should show content text when it is not null',
        (tester) async {
          // arrange
          const content = 'This is error message';

          // act
          await tester.pumpAppWidget(
            ErrorView(
              content: content,
              onRefresh: () {},
            ),
          );

          // assert
          expect(find.text(content), findsOneWidget);
        },
      );

      testWidgets(
        'should call onRefresh on button pressed',
        (tester) async {
          // arrange
          var count = 0;

          // act
          await tester.pumpAppWidget(
            ErrorView(
              onRefresh: () {
                count++;
              },
            ),
          );

          await tester.tap(find.byType(ElevatedButton));
          await tester.pumpAndSettle();

          // assert
          expect(count, 1);
        },
      );
    },
  );
}
