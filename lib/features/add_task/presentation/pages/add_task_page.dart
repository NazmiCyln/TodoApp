import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../custom/custom_app_bar.dart';

@RoutePage()
class AddTaskPage extends StatelessWidget {
  const AddTaskPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'addTask'.tr(),
      ),
    );
  }
}
