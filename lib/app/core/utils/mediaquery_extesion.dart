import 'package:flutter/widgets.dart';

extension MediaQueryExtension on BuildContext {
  /// Returns same as MediaQuery.of(context)
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns same as MediaQuery.of(context).size
  Size get size => mediaQuery.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get width => size.width;

  /// Returns same as MediaQuery.of(context).size.width
  double get relativeWidth => size.width/375;

  /// Returns same as MediaQuery.of(context).size.height
  double get height => size.height;

  /// Returns same as MediaQuery.of(context).size.height
  double get relativeHeight => size.height/812;

  // Returns size 1 using MediaQuery
  double get textScaleFactor => (width * 0.26) / 100;
}