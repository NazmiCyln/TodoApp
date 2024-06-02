import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';
import '../../../domain/models/task.dart';

part 'tasks_list_state.freezed.dart';

@freezed
class TasksListState with _$TasksListState {
  const factory TasksListState({
    required Option<Failure> failure,
    required bool isLoading,
    required List<Tasks> tasksList,
  }) = _TasksListState;

  factory TasksListState.initial({required bool isLoading}) {
    return TasksListState(
      failure: none(),
      isLoading: isLoading,
      tasksList: [],
    );
  }
}
