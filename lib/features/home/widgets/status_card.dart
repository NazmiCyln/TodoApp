import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../router/router.dart';
import '../domain/models/status_type.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    required this.statusType,
  });

  final StatusType statusType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushRoute(TasksListRoute(statusType: statusType)),
      child: Container(
        height: 60.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: gray,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: darkBlue.withOpacity(.2),
              offset: const Offset(0, 4),
              blurRadius: 6.r,
            ),
          ],
        ),
        child: Center(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
            title: Text(
              statusType.name.tr(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: darkBlue,
                  ),
            ),
            leading: Container(
              height: 40.r,
              width: 40.r,
              decoration: BoxDecoration(
                color: StatusType.color(statusType.value),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Icon(
                  StatusType.icon(statusType.value),
                  size: 20.r,
                  color: white,
                ),
              ),
            ),
            minLeadingWidth: 50.w,
            trailing: Icon(
              size: 20.r,
              Icons.arrow_forward_ios,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
