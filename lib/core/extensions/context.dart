import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  Color get primaryColor => Theme.of(this).primaryColor;

  Color get secondaryColor => Theme.of(this).colorScheme.secondary;

  ColorScheme get seed => Theme.of(this).colorScheme;

  bool get isRtl => Directionality.of(this) == TextDirection.rtl;
}
