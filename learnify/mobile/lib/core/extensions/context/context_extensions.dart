import 'dart:math';

import 'package:flutter/material.dart';

import '../../providers/language/app_localizations.dart';

/// Extensions for responsive ui designs with context.
extension ResponsivenessExtensions on BuildContext {
  MediaQueryData get _mediaQuery => MediaQuery.of(this);

  /// Top padding of the screen.
  double get screenTopPadding => _mediaQuery.viewPadding.top;

  /// One percent of the screen height, in terms of logical pixels.
  double get height => _mediaQuery.size.height * 0.01;

  /// One percent of the screen width, in terms of logical pixels.
  double get width => _mediaQuery.size.width * 0.01;

  /// Provides responsive font size value by using default 16/9 ratio.
  double get responsiveSize => min(height * 16, width * 9) / 12;

  /// Customized extreme low height value.
  double get extremeLowHeight => height * .8;

  /// Customized extreme low width value.
  double get extremeLowWidth => width * 1.2;

  /// Customized low height value.
  double get lowHeight => height * 1.5;

  /// Customized low width value.
  double get lowWidth => width * 2.3;

  /// Customized low-medium height value.
  double get lowMedHeight => height * 2.4;

  /// Customized low-medium width value.
  double get lowMedWidth => width * 3.5;

  /// Customized medium height value.
  double get medHeight => height * 4;

  /// Customized medium width value.
  double get medWidth => width * 4.8;

  /// Customized medium-high height value.
  double get medHighHeight => height * 5;

  /// Customized medium-high width value.
  double get medHighWidth => width * 6;

  /// Customized high height value.
  double get highHeight => height * 7;

  /// Customized high width value.
  double get highWidth => width * 8;

  /// Customized extreme high height value.
  double get extremeHighHeight => height * 9;

  /// Customized extreme high width value.
  double get extremeHighWidth => width * 10;

  /// Returns a responsive horizontal [SizedBox] to give space.
  SizedBox sizedW(double factor) => SizedBox(width: width * factor);

  /// Returns a responsive vertical [SizedBox] to give space.
  SizedBox sizedH(double factor) => SizedBox(height: height * factor);

  /// Maximum possible height for the screen.
  double get maxPossibleHeight => _mediaQuery.size.height;

  /// Maximum possible width for the screen.
  double get maxPossibleWidth => _mediaQuery.size.width;

  /// Returns the translated text for given key.
  String tr(String key) => AppLocalizations.of(this)?.translate(key) ?? key;
}
