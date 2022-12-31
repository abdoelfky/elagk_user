import 'package:elagk/home/presentation/components/menu_widget_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget OnboardingAppBar({
  required BuildContext context,
  required String title,
  required Function()? onTap,
  required Widget actionWidget,
}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      actions:
      [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p5),
          child: InkWell(
            onTap: CacheHelper.getData(key: AppConstants.token) == null
                ? () {
              // TODO.
              /*navigateTo(
                      context: context,
                      screenRoute: Routes.makeLoginScreen,
                      arguments: const MakeLoginScreenArguments(title: 'الشراء'),
                    );*/
            } : onTap,
            child:Center(child: actionWidget),
          ),
        ),


      ],

      leading:  IconButton(onPressed:
          ()
      { Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios),),
    );
