import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/stepper_components/stepper_content.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

  class StepperScreen extends StatelessWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: SecondAppBar(
          context: context,
          title: AppStrings.stepperYourOrder,
          onTap: () {
            navigateTo(
              context: context,
              screenRoute: Routes.basketScreen,
            );
          },
          actionWidget: const AppBarBasketIcon(),
        ),
        body: ScreenBackground(child: StepperContent()),
      ),
    );
  }
}
