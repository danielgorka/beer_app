import 'package:beer_app/l10n/l10n.dart';
import 'package:beer_app/presentation/theme.dart';
import 'package:beer_app/presentation/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

extension WidgetTesterExt on WidgetTester {
  Future<void> pumpAppWidget(Widget widget) {
    return pumpWidget(
      _wrapWithApp(
        Material(
          child: widget,
        ),
      ),
    );
  }

  void setSmallDisplaySize() {
    setDisplaySize(const Size(DisplaySize.mediumBreakpoint - 1, 1000));
  }

  void setMediumDisplaySize() {
    setDisplaySize(const Size(DisplaySize.largeBreakpoint - 1, 1000));
  }

  void setLargeDisplaySize() {
    setDisplaySize(const Size(DisplaySize.largeBreakpoint + 200, 1000));
  }

  void setDisplaySize(Size size) {
    binding.window.physicalSizeTestValue = size;
    binding.window.devicePixelRatioTestValue = 1.0;
    addTearDown(() {
      binding.window.clearPhysicalSizeTestValue();
      binding.window.clearDevicePixelRatioTestValue();
    });
  }

  void setBrightness(Brightness brightness) {
    binding.platformDispatcher.platformBrightnessTestValue = brightness;
    addTearDown(() {
      binding.platformDispatcher.clearPlatformBrightnessTestValue();
    });
  }
}

Widget _wrapWithApp(Widget widget) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: AppTheme.light(null),
    darkTheme: AppTheme.dark(null),
    home: widget,
  );
}
