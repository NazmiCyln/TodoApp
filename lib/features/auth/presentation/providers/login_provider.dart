import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/core/injections/locator.dart';

import '../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../utils/validators.dart';
import '../states/login_state/login_state.dart';

final loginProvider = NotifierProvider.autoDispose<LoginNotifier, LoginState>(LoginNotifier.new);

class LoginNotifier extends AutoDisposeNotifier<LoginState> {
  LoginNotifier();

  @override
  LoginState build() {
    _init();
    return LoginState.initial();
  }

  Future<void> _init() async {}

  Future<void> login() async {
    state = state.copyWith(isLoading: true);

    final result = await ref.read(authRepositoryProvider).login(
          email: state.email,
          password: state.password,
          rememberMe: state.rememberMe,
        );

    state = state.copyWith(isLoading: false, failure: result.getLeft());
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
    );
  }

  void showValidationErrors() {
    state = state.copyWith(validationErrorVisibility: const ValidationErrorVisibility.show());
  }

  void changeRememberMe(bool? value) {
    state = state.copyWith(rememberMe: value ?? false);
  }
}
