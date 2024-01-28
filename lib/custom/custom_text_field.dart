import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants/colors.dart';

class CustomTextField extends HookWidget {
  final GlobalKey<FormFieldState>? formFieldKey;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;

  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final bool expands;
  final bool obscureText;
  final int maxLines;
  final bool enabled;
  final bool readOnly;
  final Color? fillColor;

  const CustomTextField({
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autovalidateMode,
    this.inputFormatters,
    this.textInputType,
    this.formFieldKey,
    this.initialValue,
    this.validator,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.maxLines = 1,
    this.obscureText = false,
    this.enabled = true,
    this.expands = false,
    this.readOnly = false,
    this.style,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    useListenable(focusNode);

    return TextFormField(
      key: formFieldKey,
      initialValue: initialValue,
      style: style ?? Theme.of(context).textTheme.labelMedium?.copyWith(color: labelColor, fontWeight: FontWeight.w400),
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      keyboardType: textInputType,
      maxLines: maxLines,
      enabled: enabled,
      expands: expands,
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        enabled: enabled,
        // fillColor: !enabled ? gray.withOpacity(0.4) : fillColor,
        fillColor: fillColor ?? (!enabled ? gray : null),
        hintText: hintText,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        labelText: labelText,
      ),
    );
  }
}
