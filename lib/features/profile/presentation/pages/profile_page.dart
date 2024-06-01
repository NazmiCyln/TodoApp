import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/constants/locales.dart';
import 'package:todo_app/custom/custom_dialog.dart';
import 'package:todo_app/custom/custom_dropdown_button_formfield.dart';

import '../../../../constants/colors.dart';
import '../../../../custom/custom_app_bar.dart';
import '../../../../router/router.dart';
import '../providers/profile_provider.dart';

@RoutePage()
class ProfilePage extends ConsumerWidget {
  const ProfilePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.locale;

    ref.watch(profileProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'profile'.tr(),
        isIcon: some(true),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          const _PersonIcon(),
          SizedBox(height: 8.h),
          const _Name(),
          SizedBox(height: 26.h),
          const _ChangePassword(),
          const Divider(),
          const _SelectLanguage(),
          const Divider(),
          const _LogOut(),
        ],
      ),
    );
  }
}

class _PersonIcon extends StatelessWidget {
  const _PersonIcon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 80.r,
        height: 80.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: gray,
          border: Border.all(color: darkBlue, width: 1.r),
        ),
        child: Icon(
          Icons.person,
          color: darkBlue,
          size: 50.r,
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Nazmi Ceylan',
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: darkBlue),
    );
  }
}

class _ChangePassword extends StatelessWidget {
  const _ChangePassword();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        'changePassword'.tr(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: darkBlue),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: darkBlue,
        size: 20.r,
      ),
    );
  }
}

class _SelectLanguage extends StatelessWidget {
  const _SelectLanguage();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'selectLanguage'.tr(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: darkBlue),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      trailing: SizedBox(
        width: 120.w,
        child: CustomDropdownButtonFormField(
          value: context.locale,
          items: const [
            DropdownMenuItem(value: enLocale, child: Text('English')),
            DropdownMenuItem(value: trLocale, child: Text('Türkçe')),
          ],
          onChanged: (value) {
            log(value.toString());
            context.setLocale(value!);
          },
        ),
      ),
    );
  }
}

class _LogOut extends ConsumerWidget {
  const _LogOut();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      onTap: () {
        CustomDialog.warning(
          title: "areYouSure".tr(),
          subtitle: "areYouSureWantToLogout".tr(),
          onPrimaryButtonPressed: () {
            ref.read(profileProvider.notifier).logOut();
            context.router.replaceAll([const LoginRoute()]);
          },
          onSecondaryButtonPressed: () => context.router.maybePop(),
          primaryButtonText: "yes".tr(),
          secondaryButtonText: "close".tr(),
        ).show(context);
      },
      title: Text(
        'logOut'.tr(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: red),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      trailing: Icon(
        Icons.logout_outlined,
        color: red,
        size: 22.r,
      ),
    );
  }
}
