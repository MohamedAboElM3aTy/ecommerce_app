import 'package:flutter/material.dart';

extension DoubleExtensions on num {
  SizedBox get emptyHeight => SizedBox(height: toDouble());

  SizedBox get emptyWidth => SizedBox(width: toDouble());
}
