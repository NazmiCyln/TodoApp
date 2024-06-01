import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/custom/custom_app_bar.dart';
import 'package:todo_app/custom/custom_dialog.dart';
import 'package:todo_app/custom/custom_text_field.dart';
import 'package:todo_app/custom/password_text_field.dart';
import 'package:todo_app/router/router.dart';

import '../../../../common/loading_overlay.dart';
import '../../../../constants/colors.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/input_formatters.dart';
import '../providers/login_provider.dart';

final _formkey = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);

    ref.listen(loginProvider.select((value) => value.isLoading), (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide();
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: 'login'.tr(),
      ),
      body: Form(
        key: ref.watch(_formkey),
        autovalidateMode: state.validationErrorVisibility.when(
          hide: () => AutovalidateMode.disabled,
          show: () => AutovalidateMode.onUserInteraction,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 24.h),
                        const _AppIconAndText(),
                        SizedBox(height: 40.h),
                        const _Email(),
                        SizedBox(height: 16.h),
                        const _Password(),
                        SizedBox(height: 8.h),
                        const _RememberMe(),
                        SizedBox(height: 8.h),
                        const _ForgotPassword(),
                        SizedBox(height: 16.h),
                        const Spacer(),
                        const _RegisterButton(),
                        SizedBox(height: 16.h),
                        const _LoginButton(),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AppIconAndText extends StatelessWidget {
  const _AppIconAndText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Assets.icons.logo.svg(
          height: 120.r,
          width: 120.r,
          colorFilter: const ColorFilter.mode(
            darkBlue,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'welcome'.tr(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}

class _Email extends ConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);

    return CustomTextField(
      labelText: 'email'.tr(),
      textInputType: TextInputType.emailAddress,
      inputFormatters: eMailInputFormatters(),
      validator: (value) => ref.read(loginProvider.select((value) => value.emailFailure)).toNullable()?.message,
      onChanged: notifier.onEmailChanged,
      onFieldSubmitted: notifier.onEmailChanged,
      onSaved: notifier.onEmailChanged,
    );
  }
}

class _Password extends ConsumerWidget {
  const _Password();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(loginProvider.notifier);

    return PasswordTextField(
      labelText: 'password'.tr(),
      textInputAction: TextInputAction.done,
      validator: (value) => ref.read(loginProvider.select((value) => value.passwordFailure)).toNullable()?.message,
      onChanged: notifier.onPasswordChanged,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: notifier.onPasswordChanged,
    );
  }
}

class _RememberMe extends ConsumerWidget {
  const _RememberMe();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginProvider);

    return Align(
      alignment: Alignment.centerLeft,
      child: CheckboxListTile(
        onChanged: ref.read(loginProvider.notifier).changeRememberMe,
        title: Text(
          'rememberMe'.tr(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        value: state.rememberMe,
        dense: true,
        controlAffinity: ListTileControlAffinity.leading,
        contentPadding: EdgeInsets.zero,
      ),
    );
  }
}

class _ForgotPassword extends StatelessWidget {
  const _ForgotPassword();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'forgotPassword'.tr(),
        ),
      ),
    );
  }
}

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pushRoute(const RegisterRoute()),
      child: Text('dontHaveAccount'.tr()),
    );
  }
}

class _LoginButton extends ConsumerWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () => onPressed(context, ref),
      child: Text('login'.tr()),
    );
  }

  Future<void> onPressed(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();

    final formState = ref.read(_formkey).currentState;

    formState
      ?..save()
      ..validate();

    ref.read(loginProvider.notifier).showValidationErrors();

    if (formState!.validate()) {
      await ref.read(loginProvider.notifier).login();

      final state = ref.read(loginProvider);

      state.failure.fold(
        () => context.replaceRoute(const BottomBarRoute()),
        (t) => CustomDialog.failure(title: t.message).show(context),
      );
    }
  }
}
