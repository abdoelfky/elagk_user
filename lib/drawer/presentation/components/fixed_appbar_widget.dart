import 'package:elagk/home/presentation/components/menu_widget_component.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

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
