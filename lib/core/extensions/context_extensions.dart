import 'package:flutter/material.dart';

extension Size on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  T responsive<T>(
    T defaultVal, {
    T? sm,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 600 ? (sm ?? defaultVal) : defaultVal;
  }
}
