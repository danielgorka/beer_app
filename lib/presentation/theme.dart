import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static const Color beerColor = Color(0xFFC96E12);

  static ThemeData light(ColorScheme? colorScheme) => _theme(
        colorScheme: colorScheme,
        isDark: false,
      );

  static ThemeData dark(ColorScheme? colorScheme) => _theme(
        colorScheme: colorScheme,
        isDark: true,
      );

  static ThemeData _theme({
    required ColorScheme? colorScheme,
    required bool isDark,
  }) {
    final finalScheme = colorScheme?.harmonized() ??
        ColorScheme.fromSeed(
          brightness: isDark ? Brightness.dark : Brightness.light,
          seedColor: beerColor,
        );

    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.standard,
      colorScheme: finalScheme,
      appBarTheme: _appBarTheme(isDark),
    );
  }

  static AppBarTheme _appBarTheme(bool isDark) {
    return const AppBarTheme(
      centerTitle: true,
      elevation: 3,
    );
  }
}
