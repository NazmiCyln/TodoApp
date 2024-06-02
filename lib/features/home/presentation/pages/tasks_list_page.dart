import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/loading_widget.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/core/extensions/date_time_extensions.dart';
import 'package:todo_app/features/home/presentation/providers/tasks_list_provider.dart';

import '../../../../custom/custom_app_bar.dart';
import '../../../../custom/custom_dialog.dart';
import '../../domain/models/status_type.dart';

final selectedStatusType = Provider.autoDispose<StatusType>((ref) => throw UnimplementedError());

@RoutePage()
class TasksListPage extends ConsumerWidget implements AutoRouteWrapper {
  const TasksListPage({required this.statusType});

  final StatusType statusType;

  @override
  Widget wrappedRoute(BuildContext context) {
    return ProviderScope(
      overrides: [
        selectedStatusType.overrideWith((ref) => statusType),
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tasksListProvider);

    ref.listen(
      tasksListProvider,
      (previous, next) {
        if (previous!.failure != next.failure) {
          next.failure.fold(
            () {},
            (a) => CustomDialog.failure(
              title: "error".tr(),
              subtitle: a.message,
              primaryButtonText: 'tryAgain'.tr(),
              onClosedPressed: () {
                context.router.maybePop();
                context.router.maybePop();
              },
              onPrimaryButtonPressed: () {
                context.router.maybePop();
                context.router.maybePop();
              },
            ).show(context),
          );
        }
      },
    );

    return Scaffold(
      appBar: CustomAppBar(title: statusType.title),
      body: state.isLoading
          ? const _LoadingState()
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  ListView.separated(
                    itemCount: state.tasksList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final value = state.tasksList[index];

                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: gray,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: shadowColor),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
                          dense: true,
                          minLeadingWidth: 60.r,
                          title: Text(value.title),
                          subtitle: Text(value.description),
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(DateTime.now().ddMMMM),
                              Text(DateTime.now().HHmm),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: LoadingWidget());
  }
}
