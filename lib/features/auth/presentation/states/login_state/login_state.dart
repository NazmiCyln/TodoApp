import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';
import '../../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../../core/models/value_failure/value_failure.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required Option<Failure> failure,
    required bool isLoading,
    required bool rememberMe,
    required String email,
    required String password,
    required Option<ValueFailure> emailFailure,
    required Option<ValueFailure> passwordFailure,
    required ValidationErrorVisibility validationErrorVisibility,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      failure: none(),
      isLoading: false,
      rememberMe: false,
      email: '',
      password: '',
      emailFailure: none(),
      passwordFailure: none(),
      validationErrorVisibility: const ValidationErrorVisibility.hide(),
    );
  }
}
