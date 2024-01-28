import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/gen/assets.gen.dart';
import 'constants/colors.dart';

import 'core/injections/locator.dart';
import 'router/router.dart';

final _isTokenExpiredProvider = FutureProvider.autoDispose((ref) => ref.watch(authRepositoryProvider).isRememberMe());

@RoutePage()
class SplashPage extends HookConsumerWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        FlutterNativeSplash.remove();

        Future.delayed(const Duration(seconds: 3), () async {
          if (await ref.watch(_isTokenExpiredProvider.future)) {
            if (context.mounted) {
              context.replaceRoute(const BottomBarRoute());
            }
          } else {
            if (context.mounted) {
              return context.replaceRoute(const LoginRoute());
            }
          }
        });

        return null;
      },
      [],
    );
    return Material(
      color: darkBlue.withOpacity(0.6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (rect) => const LinearGradient(
              colors: [blue, red, green, primary, yellow],
            ).createShader(rect),
            child: Assets.icons.logo.svg(
              height: 120.r,
              width: 120.r,
              colorFilter: const ColorFilter.mode(
                white,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GradientAnimationText(
            text: Text(
              "Todo App",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
            ),
            colors: const [blue, red, green, primary, yellow],
            duration: const Duration(milliseconds: 3000),
          ),
        ],
      ),
    );
  }
}
