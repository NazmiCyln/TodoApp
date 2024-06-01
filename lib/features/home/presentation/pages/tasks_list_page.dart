import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/core/extensions/date_time_extensions.dart';

import '../../../../custom/custom_app_bar.dart';
import '../../domain/models/status_type.dart';

@RoutePage()
class TasksListPage extends StatelessWidget {
  const TasksListPage({required this.statusType});

  final StatusType statusType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: statusType.title),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: shadowColor),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                  dense: true,
                  minLeadingWidth: 60.r,
                  title: const Text('title'),
                  subtitle: const Text('subtitle'),
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(DateTime.now().ddMMMM),
                      Text(DateTime.now().HHmm),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
