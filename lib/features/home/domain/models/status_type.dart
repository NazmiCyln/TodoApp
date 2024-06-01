import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class StatusType extends Equatable {
  final int id;
  final String title;

  const StatusType({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];

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
