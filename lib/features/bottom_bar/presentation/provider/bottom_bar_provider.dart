import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/injections/locator.dart';

import '../../../home/presentation/providers/status_type_provider.dart';
import '../state/bottom_bar_state.dart';

final bottomBarProvider = NotifierProvider.autoDispose<BottomBarNotifier, BottomBarState>(BottomBarNotifier.new);

class BottomBarNotifier extends AutoDisposeNotifier<BottomBarState> {
  BottomBarNotifier();

  @override
  BottomBarState build() {
    _init();
    return BottomBarState.initial(isLoading: true);
  }

  Future<void> _init() async {
    await getStatusTypes();
  }

  Future<void> getStatusTypes() async {
    final result = await ref.read(homeRepositoryProvider).getStatusTypes();

    state = state.copyWith(failure: result.fold((l) => some(l), (r) => none()), isLoading: false);

    ref.read(statusTypeProvider.notifier).state = result.getOrElse((l) => []);
  }
}
