import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/router/router.dart';
import '../../../../common/loading_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../custom/custom_dialog.dart';
import '../provider/bottom_bar_provider.dart';

final _iconPaths = [
  Icons.home,
  Icons.person,
];

@RoutePage()
class BottomBarWidget extends ConsumerWidget {
  const BottomBarWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bottomBarProvider);

    ref.listen(
      bottomBarProvider,
      (previous, next) {
        if (previous!.failure != next.failure) {
          next.failure.fold(
            () {},
            (a) => CustomDialog.failure(
              title: "error".tr(),
              subtitle: a.message,
              primaryButtonText: 'tryAgain'.tr(),
              onPrimaryButtonPressed: () {
                context.router.maybePop();
                // ref.read(bottomBarProvider.notifier).refresh();
              },
            ).show(context),
          );
        }
      },
    );

    final routeNames = [
      "home".tr(),
      "profile".tr(),
    ];

    context.locale;

    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        CustomDialog.warning(
          subtitle: "doYouWantToExitApp".tr(),
          secondaryButtonText: "no".tr(),
          primaryButtonText: "yes".tr(),
          onPrimaryButtonPressed: () => SystemNavigator.pop(),
          onSecondaryButtonPressed: () => context.router.maybePop(),
        ).show(context);
      },
      child: Stack(
        children: [
          AutoTabsScaffold(
            routes: const [
              HomeRoute(),
              ProfileRoute(),
            ],
            floatingActionButton: const _FloatingActionButton(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBuilder: (context, tabsRouter) => AnimatedBottomNavigationBar.builder(
              safeAreaValues: const SafeAreaValues(bottom: false),
              height: 72.h,
              gapWidth: 72.h,
              onTap: tabsRouter.setActiveIndex,
              activeIndex: tabsRouter.activeIndex,
              gapLocation: GapLocation.center,
              notchMargin: 10.r,
              leftCornerRadius: 8.r,
              rightCornerRadius: 8.r,
              shadow: Shadow(
                color: shadowColor,
                blurRadius: 12.r,
                offset: const Offset(0, -4),
              ),
              notchSmoothness: NotchSmoothness.softEdge,
              itemCount: _iconPaths.length,
              tabBuilder: (index, isActive) => _BottomNavigationBarIcon(
                iconPath: _iconPaths.elementAt(index),
                isActive: isActive,
                routeName: routeNames.elementAt(index),
              ),
            ),
          ),
          if (state.isLoading) const _LoadingWidget(),
        ],
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: darkBlue.withOpacity(.4),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 100.r,
              maxHeight: 100.r,
              minWidth: 100.r,
              minHeight: 100.r,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: const LoadingWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add, size: 28.h),
      onPressed: () => context.router.push(const AddTaskRoute()),
    );
  }
}

class _BottomNavigationBarIcon extends ConsumerWidget {
  final IconData iconPath;
  final bool isActive;
  final String routeName;

  const _BottomNavigationBarIcon({
    required this.iconPath,
    required this.isActive,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconPath,
          color: isActive ? primary : darkBlue,
          size: 24.sp,
        ),
        SizedBox(height: 3.h),
        Text(
          routeName,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isActive ? primary : darkBlue,
                fontWeight: FontWeight.w500,
                fontSize: 8.sp,
              ),
        ),
      ],
    );
  }
}
