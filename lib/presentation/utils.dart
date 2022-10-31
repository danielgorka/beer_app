import 'package:flutter/material.dart';

/// Small: 0-799
/// Medium: 800-1199
/// Large: 1200+
abstract class DisplaySize {
  static const double mediumBreakpoint = 800;
  static const double largeBreakpoint = 1200;

  static bool isSmall(BoxConstraints constraints) =>
      constraints.maxWidth < mediumBreakpoint;

  static bool isMedium(BoxConstraints constraints) =>
      constraints.maxWidth >= mediumBreakpoint &&
      constraints.maxWidth < largeBreakpoint;

  static bool isLarge(BoxConstraints constraints) =>
      constraints.maxWidth >= largeBreakpoint;
}

/// All available elevation levels in Material 3.
///
/// See [ElevationOverlay.applySurfaceTint]
enum ElevationLevel {
  /// elevation: 0, opacity: 0.00
  level0(0),

  /// elevation: 1, opacity: 0.05
  level1(1),

  /// elevation: 3, opacity: 0.08
  level2(3),

  /// elevation: 6, opacity: 0.11
  level3(6),

  /// elevation: 8, opacity: 0.12
  level4(8),

  /// elevation: 12, opacity: 0.14
  level5(12);

  const ElevationLevel(this.elevation);

  final double elevation;
}

const borderRadius = BorderRadius.all(Radius.circular(32));

const standardAnimDuration = Duration(milliseconds: 300);
const emphasizedAnimDuration = Duration(milliseconds: 500);
