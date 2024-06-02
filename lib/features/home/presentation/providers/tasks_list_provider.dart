import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../pages/tasks_list_page.dart';
import '../states/tasks_list/tasks_list_state.dart';

final tasksListProvider = NotifierProvider.autoDispose<TasksListNotifier, TasksListState>(
  TasksListNotifier.new,
  dependencies: [selectedStatusType],
);

class TasksListNotifier extends AutoDisposeNotifier<TasksListState> {
  TasksListNotifier();

  @override
  TasksListState build() {
    _init();
    return TasksListState.initial(isLoading: true);
  }

  Future<void> _init() async {
    await getTaskList();
  }

  Future<void> getTaskList() async {
    final result = await ref.read(homeRepositoryProvider).getTasksList(statusId: ref.read(selectedStatusType).id);

    state = state.copyWith(
      failure: result.fold((l) => some(l), (r) => none()),
      isLoading: false,
      tasksList: result.getOrElse((l) => []),
    );
  }
}
