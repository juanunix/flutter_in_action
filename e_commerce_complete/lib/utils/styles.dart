import 'package:flutter/material.dart';

class Spacing {
  static const double _matGridUnit = 8.0;
  static double matGridUnit({scale = 1}) {
    // Material design grid uses multiples of 8
    // Multiples of 4 are acceptable if needed
    // Only accept numbers that are full or half units of _matGridUnit
    assert(scale % .5 == 0);
    return _matGridUnit * scale;
  }
}

class AppColors {
  /// App Background
  /// Off white
  static const background = Color(0xFFF5F5F5);
  static const cardBackground = Colors.white;
  static const activeFillColor = Color(0xFFE0E0E0);

  /// Text Theme
  /// For cards, content, and canvas:
  static const textColor = Colors.black54;

  /// For 'Primary' theme
  /// For headings
  static const displayTextColor = Colors.black;

  /// for 'Accent' theme
  static const accentTextColor = Colors.white70;

  static MaterialColor primary = new MaterialColor(0xFFC18083, _primarySwatch);
  static MaterialColor accent = new MaterialColor(0xFFFEEAE6, _accentSwatch);
}

Map<int, Color> _primarySwatch = {
  50: Color(0xFFFFF0E9),
  100: Color(0xFFFFDBCF),
  200: Color(0xFFFCB8AB),
  300: Color(0xFFF2A9A5),
  400: Color(0xFFE29896),
  500: Color(0xFFC18083),
  600: Color(0xFFA36A72),
  700: Color(0xFF84565E),
  800: Color(0xFF664046),
  900: Color(0xFF442B2D),
};

Map<int, Color> _accentSwatch = {
  50: Color(0xFFFEEAE6),
  100: Color(0xFFFFCEB9),
  200: Color(0xFFFEAE8B),
  300: Color(0xFFFC8F5C),
  400: Color(0xFFFA7736),
  500: Color(0xFFF86203),
  600: Color(0xFFEE5C00),
  700: Color(0xFFE05400),
  800: Color(0xFFD24D00),
  900: Color(0xFFBA4000),
};
