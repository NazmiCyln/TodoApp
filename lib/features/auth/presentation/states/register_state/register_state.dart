import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';
import '../../../../../core/models/validation_error_visibility/validation_error_visibility.dart';
import '../../../../../core/models/value_failure/value_failure.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required Option<Failure> failure,
    required bool isLoading,
    required String email,
    required String password,
    required String passwordAgain,
    required Option<ValueFailure> emailFailure,
    required Option<ValueFailure> passwordFailure,
    required Option<ValueFailure> passwordAgainFailure,
    required ValidationErrorVisibility validationErrorVisibility,
  }) = _RegisterState;

  factory RegisterState.initial() {
    return RegisterState(
      failure: none(),
      isLoading: false,
      email: '',
      password: '',
      passwordAgain: '',
      emailFailure: none(),
      passwordFailure: none(),
      passwordAgainFailure: none(),
      validationErrorVisibility: const ValidationErrorVisibility.hide(),
    );
  }

  const RegisterState._();

  bool get isValid => emailFailure.isNone() && passwordFailure.isNone() && passwordAgainFailure.isNone();
}
