import 'package:auto_route/auto_route.dart';

import '../features/add_task/presentation/pages/add_task_page.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';
import '../features/home/domain/models/status_type.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/home/presentation/pages/tasks_list_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../splash_page.dart';
import '../theme/bottom_bar_widget.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Page|Screen|View|Widget,Route")
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(
          page: BottomBarRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page, initial: true),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: AddTaskRoute.page),
        AutoRoute(page: TasksListRoute.page),
      ];
}
