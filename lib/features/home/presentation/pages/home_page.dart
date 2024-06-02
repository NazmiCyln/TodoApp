import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../auth/presentation/providers/user_provider.dart';
import '../../widgets/status_card.dart';
import '../providers/home_provider.dart';
import '../providers/status_type_provider.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.locale;

    ref.watch(homeProvider);

    final statusTypes = ref.watch(statusTypeProvider);

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
          ListView.separated(
            itemCount: statusTypes.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final statusType = statusTypes[index];

              return StatusCard(statusType: statusType);
            },
          ),
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

class _Name extends ConsumerWidget {
  const _Name();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        '${user.name} ${user.surname}',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: textColor,
            ),
      ),
    );
  }
}
