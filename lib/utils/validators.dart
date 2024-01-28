import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fpdart/fpdart.dart';

import '../constants/regexps.dart';
import '../constants/value_failure_messages.dart';
import '../core/models/value_failure/value_failure.dart';

const minPasswordLength = 6;

Option<ValueFailure> validateEmailAddress(String input, {bool isRequired = true, String? customMessage}) {
  if (input.isEmpty && isRequired) {
    return some(ValueFailure.invalidInput(customMessage ?? emptyEmailFailureMessage));
  }

  if (isRequired ? EmailValidator.validate(input) : (input.isEmpty || EmailValidator.validate(input))) {
    return none();
  } else {
    return some(ValueFailure.invalidInput(invalidEmailFailureMessage));
  }
}

Option<ValueFailure> validateEmptiness(String input, {String? customMessage}) {
  if (input.isEmpty) {
    return some(ValueFailure.invalidInput(customMessage ?? emptyInputFailureMessage));
  }

  return none();
}

Option<ValueFailure> validatePhone(String input, {String? customMessage}) {
  if (input.isEmpty) {
    return some(ValueFailure.invalidInput(customMessage ?? emptyInputFailureMessage));
  }

  if (input.length == 11) {
    return none();
  } else {
    return some(ValueFailure.invalidInput(emptyPhoneFailureMessage));
  }
}

Option<ValueFailure> validateDescription(String input) {
  if (input.isEmpty) {
    return some(ValueFailure.invalidInput(emptyInputFailureMessage));
  }

  return none();
}

Option<ValueFailure> validatePassword(String? input, {bool isLogin = false}) {
  if (input == '' || input == null) return some(ValueFailure.invalidInput(emptyPasswordFailureMessage));

  if (input.length < minPasswordLength) return some(ValueFailure.invalidInput(shortPasswordFailureMessage));

  if (!passwordRegExp.hasMatch(input) && !isLogin) {
    return some(ValueFailure.invalidInput(invalidPasswordFailureMessage));
  }

  return none();
}

Option<ValueFailure> validatePasswordAgain(String? input, String password) {
  if (input == '' || input == null) return some(ValueFailure.invalidInput(emptyPasswordFailureMessage));

  if (input.length < minPasswordLength) return some(ValueFailure.invalidInput(shortPasswordFailureMessage));

  if (!passwordRegExp.hasMatch(input)) {
    return some(ValueFailure.invalidInput(invalidPasswordFailureMessage));
  }

  if (input.length >= minPasswordLength && password.length >= minPasswordLength) {
    if (input != password) return some(ValueFailure.invalidInput(passwordNotMatchFailureMessage));
  }
  return none();
}

Option<ValueFailure> validateConfirmPassword(String? input, String password) {
  if (input != password) return some(ValueFailure.invalidInput(passwordNotMatchFailureMessage));

  return none();
}

String? validateDropDownValue(dynamic value) {
  if (value == null) {
    return 'emptyInputFailureMessage'.tr();
  }
  return null;
}
