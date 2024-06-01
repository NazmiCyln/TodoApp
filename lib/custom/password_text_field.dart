import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/colors.dart';

import '../utils/input_formatters.dart';
import 'custom_text_field.dart';

class PasswordTextField extends HookWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final BoxConstraints? prefixIconConstraints;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final bool isDisabled;

  ///Default is lock icon
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;

  const PasswordTextField({
    this.prefixIconConstraints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textInputType = TextInputType.visiblePassword,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.labelText,
    this.autovalidateMode,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    final focusNode = useFocusNode();
    useListenable(focusNode);

    return CustomTextField(
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      textInputType: textInputType,
      inputFormatters: passwordInputFormatters(),
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText.value,
      textInputAction: textInputAction,
      hintText: hintText,
      labelText: labelText,
      validator: validator,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      suffixIconConstraints: BoxConstraints(minHeight: 48.r, minWidth: 48.r),
      suffixIcon: GestureDetector(
        onTap: () => obscureText.value = !obscureText.value,
        child: getSuffixIcon(
          context,
          obscureText: obscureText.value,
          hasFocus: focusNode.hasFocus,
        ),
      ),
      enabled: !isDisabled,
      autovalidateMode: autovalidateMode,
    );
  }

  Widget getSuffixIcon(
    BuildContext context, {
    required bool obscureText,
    required bool hasFocus,
  }) {
    late final IconData image;

    if (obscureText) {
      image = Icons.visibility_off;
    } else {
      image = Icons.visibility;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 18.h,
      ),
      child: Icon(
        image,
        color: isDisabled ? gray : labelColor,
        size: 24.r,
      ),
    );
  }
}
