import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../constants/regexps.dart';
import 'text_input_formatters.dart';

final phoneFormatter = MaskTextInputFormatter(mask: '#### ### ## ##');

List<TextInputFormatter> eMailInputFormatters() {
  return [
    LengthLimitingTextInputFormatter(200),
    FilteringTextInputFormatter.deny(spaceRegExp),
    FilteringTextInputFormatter.deny(emojiRegexp),
    FilteringTextInputFormatter.deny(turkishCharactersRegexp),
  ];
}

List<TextInputFormatter> passwordInputFormatters() {
  return [
    LengthLimitingTextInputFormatter(12),
    FilteringTextInputFormatter.deny(spaceRegExp),
    FilteringTextInputFormatter.deny(emojiRegexp),
  ];
}

List<TextInputFormatter> phoneNumberInputFormatters() {
  return [
    LengthLimitingTextInputFormatter(14),
    PhoneNumberFormatter(),
  ];
}

List<TextInputFormatter> fullNameInputFormatters() {
  return [
    FilteringTextInputFormatter.deny(digitsRegexp),
    FilteringTextInputFormatter.deny(emojiRegexp),
    FilteringTextInputFormatter.deny(RegExp('[.;,:<>?/|`~!@#\$%^&*()_+\\-=\\[\\]{}"\']')),
    FilteringTextInputFormatter.deny(RegExp(r"\s "), replacementString: " "),
    FilteringTextInputFormatter.allow(RegExp(r'^\S.*')),
    FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-ZçÇğĞıİöÖşŞüÜ\s]+$')),
  ];
}
