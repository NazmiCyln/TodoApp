import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/constants/colors.dart';

class InputField extends StatelessWidget {
  const InputField({
    required this.title,
    required this.widget,
  });

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: labelColor, fontSize: 15.sp),
        ),
        SizedBox(height: 6.h),
        widget,
      ],
    );
  }
}
