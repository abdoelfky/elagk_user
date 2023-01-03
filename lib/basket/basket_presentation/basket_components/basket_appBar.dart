import 'package:elagk/home/presentation/components/menu_widget_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget BasketAppBar({
  required BuildContext context,
  required String title,

}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(title, style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black
      )),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      leading: IconButton(onPressed:
          ()
      { Navigator.pop(context); }, icon: Icon(Icons.arrow_back),),
    );
