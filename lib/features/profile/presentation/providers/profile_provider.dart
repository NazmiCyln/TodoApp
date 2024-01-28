import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
import '../states/profile/profile_state.dart';

final profileProvider = NotifierProvider.autoDispose<ProfileNotifier, ProfileState>(ProfileNotifier.new);

class ProfileNotifier extends AutoDisposeNotifier<ProfileState> {
  ProfileNotifier();

  @override
  ProfileState build() {
    _init();
    return ProfileState.initial();
  }

  Future<void> _init() async {}

  Future<void> logOut() async {
    await ref.read(profileRepositoryProvider).logOut();
  }
}
