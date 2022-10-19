import 'package:beer_app/presentation/app.dart';
import 'package:dynamic_color/samples.dart';
import 'package:dynamic_color/test_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'App',
    () {
      testWidgets(
        'should show MaterialApp with themes based on dynamic colors',
        (tester) async {
          // arrange
          DynamicColorTestingUtils.setMockDynamicColors(
            corePalette: SampleCorePalettes.green,
          );

          // act
          await tester.pumpWidget(const App());
          await tester.pump();

          // assert
          final finder = find.byType(MaterialApp);
          final materialApp = tester.widget<MaterialApp>(finder);
          expect(
            materialApp.theme!.colorScheme.primary,
            SampleColorSchemes.green(Brightness.light).primary,
          );
          expect(
            materialApp.darkTheme!.colorScheme.primary,
            SampleColorSchemes.green(Brightness.dark).primary,
          );
        },
      );
    },
  );
}
