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

const animDuration = Duration(milliseconds: 300);
