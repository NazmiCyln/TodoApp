import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'tasks_list_state.freezed.dart';

@freezed
class TasksListState with _$TasksListState {
  const factory TasksListState({
    required Option<Failure> failure,
    required bool isLoading,
  }) = _TasksListState;

  factory TasksListState.initial() {
    return TasksListState(
      failure: none(),
      isLoading: false,
    );
  }
}
