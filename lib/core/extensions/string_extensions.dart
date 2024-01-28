import 'package:easy_localization/easy_localization.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

extension StringExtensions on String {
  String get cutLastThreeElements => substring(0, length - 3);

  String get phoneFormat => MaskTextInputFormatter(
        mask: '0 ### ### ## ##',
        filter: {"#": RegExp('[0-9]')},
        initialText: this,
      ).getMaskedText();

  String convertCurrency([bool addSymbol = true]) {
    return NumberFormat.currency(
      locale: "tr_TR",
      symbol: addSymbol ? "₺" : "",
    ).format(double.tryParse(this));
  }

  //Accepts whitespace
  bool isAlphaNumeric() => RegExp(r'^(?=.*\d)(?=.*[A-Z])(?=.*[a-z])[A-Za-z0-9\s]{5,15}$').hasMatch(this);

  DateTime get parseTime => DateTime(
        0,
        0,
        0,
        int.parse(split(':')[0]),
        int.parse(split(':')[1]),
      );
}
