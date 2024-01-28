import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../domain/models/status_type.dart';
import '../../widgets/status_card.dart';
import '../providers/home_provider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.locale;

    ref.watch(homeProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'home'.tr(),
        isIcon: some(true),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.h),
          const _Welcome(),
          SizedBox(height: 4.h),
          const _Name(),
          SizedBox(height: 60.h),
          const _New(),
          SizedBox(height: 16.h),
          const _Continues(),
          SizedBox(height: 16.h),
          const _Finished(),
        ],
      ),
    );
  }
}

class _Welcome extends StatelessWidget {
  const _Welcome();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        "welcome".tr(),
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: darkBlue,
            ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        "Nazmi Ceylan",
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}

class _New extends StatelessWidget {
  const _New();

  @override
  Widget build(BuildContext context) {
    return const StatusCard(statusType: StatusType.newStatus);
  }
}

class _Continues extends StatelessWidget {
  const _Continues();

  @override
  Widget build(BuildContext context) {
    return const StatusCard(statusType: StatusType.continues);
  }
}

class _Finished extends StatelessWidget {
  const _Finished();

  @override
  Widget build(BuildContext context) {
    return const StatusCard(statusType: StatusType.finished);
  }
}
