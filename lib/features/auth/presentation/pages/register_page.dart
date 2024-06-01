import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/router/router.dart';

import '../../../../common/loading_overlay.dart';
import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../custom/custom_dialog.dart';
import '../../../../custom/custom_text_field.dart';
import '../../../../custom/password_text_field.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../utils/input_formatters.dart';
import '../providers/register_provider.dart';

final _formkey = Provider.autoDispose((ref) => GlobalKey<FormState>());

@RoutePage()
class RegisterPage extends ConsumerWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(registerProvider);

    ref.listen(registerProvider.select((value) => value.isLoading), (previous, next) {
      if (next) {
        LoadingScreen().show(context: context);
      } else {
        LoadingScreen().hide();
      }
    });

    return Scaffold(
      appBar: CustomAppBar(
        title: 'register'.tr(),
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
                        SizedBox(height: 16.h),
                        const _PasswordAgain(),
                        const Spacer(),
                        SizedBox(height: 16.h),
                        const _RegisterButton(),
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
          'enterYourInformation'.tr(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class _Email extends ConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);

    return CustomTextField(
      labelText: 'email'.tr(),
      textInputType: TextInputType.emailAddress,
      inputFormatters: eMailInputFormatters(),
      validator: (value) => ref.read(registerProvider.select((value) => value.emailFailure)).toNullable()?.message,
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
    final notifier = ref.watch(registerProvider.notifier);

    return PasswordTextField(
      labelText: 'password'.tr(),
      validator: (value) => ref.read(registerProvider.select((value) => value.passwordFailure)).toNullable()?.message,
      onChanged: notifier.onPasswordChanged,
      onFieldSubmitted: notifier.onPasswordChanged,
      onSaved: notifier.onPasswordChanged,
    );
  }
}

class _PasswordAgain extends ConsumerWidget {
  const _PasswordAgain();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(registerProvider.notifier);

    return PasswordTextField(
      labelText: 'passwordAgain'.tr(),
      textInputAction: TextInputAction.done,
      validator: (value) =>
          ref.read(registerProvider.select((value) => value.passwordAgainFailure)).toNullable()?.message,
      onChanged: notifier.onPasswordAgainChanged,
      onFieldSubmitted: notifier.onPasswordAgainChanged,
      onSaved: notifier.onPasswordAgainChanged,
    );
  }
}

class _RegisterButton extends ConsumerWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton(
      onPressed: () => onPressed(context, ref),
      child: Text('register'.tr()),
    );
  }

  Future<void> onPressed(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();

    final formState = ref.read(_formkey).currentState;

    formState
      ?..save()
      ..validate();

    ref.read(registerProvider.notifier).showValidationErrors();

    if (formState!.validate()) {
      await ref.read(registerProvider.notifier).register();

      final state = ref.read(registerProvider);

      state.failure.fold(
        () => CustomDialog.success(
          subtitle: "registerSuccessMessage".tr(),
          onPrimaryButtonPressed: () => context.router.replaceAll(const [LoginRoute()]),
        ).show(context),
        (t) => CustomDialog.failure(subtitle: t.message).show(context),
      );
    }
  }
}
