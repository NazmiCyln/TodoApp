import 'package:equatable/equatable.dart';
import 'status_type.dart';

class Tasks extends Equatable {
  final String createdAt;
  final String description;
  final StatusType statusType;
  final String title;
  final String updatedAt;

  const Tasks({
    required this.createdAt,
    required this.description,
    required this.statusType,
    required this.title,
    required this.updatedAt,
  });

  @override
  List<dynamic> get props => [createdAt, description, statusType, title, updatedAt];
}
