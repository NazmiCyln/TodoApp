import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/injections/locator.dart';
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

  Future<void> register() async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(authRepositoryProvider).register(
          email: state.email,
          password: state.password,
        );

    state = state.copyWith(
      isLoading: false,
      failure: result.fold((l) => some(l), (r) => none()),
    );
  }

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
