import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/tasks_list/tasks_list_state.dart';

final tasksListProvider = NotifierProvider.autoDispose<TasksListNotifier, TasksListState>(TasksListNotifier.new);

class TasksListNotifier extends AutoDisposeNotifier<TasksListState> {
  TasksListNotifier();

  @override
  TasksListState build() {
    _init();
    return TasksListState.initial();
  }

  Future<void> _init() async {}
}
