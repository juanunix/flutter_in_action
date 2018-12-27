import 'package:flutter/material.dart';

class AppStyle {
  // Generic Material Spacing Sizes
  static const double _matGridUnit = 8.0;
  static double matGridUnit({scale = 1}) {
    // Material design grid uses multiples of 8
    // Multiples of 4 are acceptable if needed
    // Only accept numbers that are full or half units of _matGridUnit
    assert(scale % .5 == 0);
    return _matGridUnit * scale;
  }

  // Color
  static const primaryTextColor = Colors.black54;
  static const displayTextColor = Colors.black54;
  static const background = Color(0xFFF5F5F5);
  static const textColorLight = Colors.white30;

  static const uiColor = Color(0xFFB59FB5);
}
