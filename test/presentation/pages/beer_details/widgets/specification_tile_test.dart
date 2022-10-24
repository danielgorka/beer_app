import 'package:beer_app/presentation/pages/beer_details/widgets/specification_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/widget_tester_ext.dart';

void main() {
  group(
    'SpecificationTile',
    () {
      const title = 'Title';
      const tooltip = 'Tooltip';
      const helpUrl = 'https://help.com';
      const value = 'Value';

      testWidgets(
        'should show title, value and IconButton with tooltip '
        'when value is not null',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const SpecificationTile(
              title: title,
              tooltip: tooltip,
              helpUrl: helpUrl,
              value: value,
            ),
          );

          // assert
          expect(find.text(title), findsOneWidget);
          expect(find.text(value), findsOneWidget);
          final finder = find.byType(IconButton);
          final iconButton = tester.widget<IconButton>(finder);
          expect(iconButton.tooltip, tooltip);
        },
      );

      testWidgets(
        'should now show title and IconButton when value is null',
        (tester) async {
          // act
          await tester.pumpAppWidget(
            const SpecificationTile(
              title: title,
              tooltip: tooltip,
              helpUrl: helpUrl,
              value: null,
            ),
          );

          // assert
          expect(find.text(title), findsNothing);
          expect(find.byType(IconButton), findsNothing);
        },
      );

      testWidgets(
        'should launch helpUrl on IconButton pressed',
        (tester) async {
          // arrange
          const channel = MethodChannel('plugins.flutter.io/url_launcher');
          const channelWindows =
              MethodChannel('plugins.flutter.io/url_launcher_windows');
          const channelLinux =
              MethodChannel('plugins.flutter.io/url_launcher_linux');

          MethodCall? methodCall;
          Future<void> handler(MethodCall call) async {
            expect(methodCall, isNull);
            methodCall = call;
          }

          TestWidgetsFlutterBinding.ensureInitialized();
          TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
              .setMockMethodCallHandler(channel, handler);
          TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
              .setMockMethodCallHandler(channelWindows, handler);
          TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
              .setMockMethodCallHandler(channelLinux, handler);

          // act
          await tester.pumpAppWidget(
            const SpecificationTile(
              title: title,
              tooltip: tooltip,
              helpUrl: helpUrl,
              value: value,
            ),
          );

          await tester.tap(find.byType(IconButton));
          await tester.pumpAndSettle();

          // assert
          expect(methodCall!.method, 'launch');
          // ignore: avoid_dynamic_calls
          expect(methodCall!.arguments['url'], helpUrl);
        },
      );
    },
  );
}
