import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../states/home/home_state.dart';

final homeProvider = NotifierProvider.autoDispose<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AutoDisposeNotifier<HomeState> {
  HomeNotifier();

  @override
  HomeState build() {
    _init();
    return HomeState.initial();
  }

  Future<void> _init() async {}
}
