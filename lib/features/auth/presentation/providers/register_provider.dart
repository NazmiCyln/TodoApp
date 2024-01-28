import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../states/register_state/register_state.dart';

final registerProvider = NotifierProvider.autoDispose<RegisterNotifier, RegisterState>(RegisterNotifier.new);

class RegisterNotifier extends AutoDisposeNotifier<RegisterState> {
  RegisterNotifier();

  @override
  RegisterState build() {
    _init();
    return RegisterState.initial();
  }

  Future<void> _init() async {}

  Future<void> register() async {}

  void onEmailChanged(String? value) {
    state = state.copyWith(
      email: value ?? "",
      emailFailure: validateEmailAddress(value ?? ""),
    );
  }

  void onPasswordChanged(String? value) {
    state = state.copyWith(
      password: value ?? "",
      passwordFailure: validatePassword(value ?? ""),
      passwordAgainFailure: validatePasswordAgain(state.passwordAgain, value ?? ""),
    );
  }

  void onPasswordAgainChanged(String? value) {
    state = state.copyWith(
      passwordAgain: value ?? "",
      passwordAgainFailure: validatePasswordAgain(value ?? "", state.password),
    );
  }

  void showValidationErrors() {
    state = state.copyWith(validationErrorVisibility: const ValidationErrorVisibility.show());
  }
}
