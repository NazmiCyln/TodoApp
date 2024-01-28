import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

enum StatusType {
  newStatus(1),
  continues(2),
  finished(3);

  final int value;

  const StatusType(this.value);

  static String name(int value) {
    switch (value) {
      case 1:
        return "newStatus";
      case 2:
        return "continues";
      case 3:
        return "finished";
      default:
        return "newStatus";
    }
  }

  static IconData? icon(int value) {
    switch (value) {
      case 1:
        return Icons.new_releases_outlined;
      case 2:
        return Icons.alarm_rounded;
      case 3:
        return Icons.check_circle_outline;
      default:
        return Icons.new_releases_outlined;
    }
  }

  static Color? color(int value) {
    switch (value) {
      case 1:
        return yellow;
      case 2:
        return blue;
      case 3:
        return green;
      default:
        return yellow;
    }
  }
}
