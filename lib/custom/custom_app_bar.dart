import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';

import '../constants/constans.dart';
import '../gen/assets.gen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final double? leadingWidth;
  final List<Widget>? actions;
  final Option<bool> isIcon;

  const CustomAppBar({
    this.title,
    this.actions,
    this.leading,
    this.leadingWidth,
    this.isIcon = const None(),
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null ? Text(title!) : null,
      toolbarHeight: 50.h,
      leadingWidth: 56.w,
      actions: actions,
      leading: isIcon.fold(
        () => null,
        (t) => Padding(
          padding: EdgeInsets.all(8.r),
          child: Assets.icons.logo.svg(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kAppBarHeight);
}
