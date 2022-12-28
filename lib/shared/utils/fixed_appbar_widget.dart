
import 'package:flutter/material.dart';

import '../../home/presentation/components/menu_widget_component.dart';
import 'app_values.dart';

PreferredSizeWidget fixedAppBar({
  required BuildContext context,
  required String title,
}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(title, style: Theme.of(context).textTheme.headlineLarge),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      leading: const MenuWidget(),
    );
