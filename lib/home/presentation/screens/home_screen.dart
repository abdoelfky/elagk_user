import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/home/presentation/components/app_bar_title.dart';
import 'package:elagk/home/presentation/components/body_welcome.dart';
import 'package:elagk/home/presentation/components/home_app_bar.dart';
import 'package:elagk/home/presentation/components/offers_slider_widget.dart';
import 'package:elagk/home/presentation/components/pharmacies_widget.dart';
import 'package:elagk/home/presentation/components/search_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // TODO: remove Scaffold qnd appBar.
          appBar: homePageAppBar(
            title:AppBarTitle(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
            actionWidget: const AppBarBasketIcon(),
            context,
          ),
          body: ScreenBackground(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p15),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(

                  children:
                [
                  SizedBox(height: mediaQueryHeight(context)*.025,),
                  WelcomeWidget(),
                  SizedBox(height: mediaQueryHeight(context)*.025,),
                  SearchWidget(),
                  SizedBox(height: mediaQueryHeight(context)*.025,),
                  OffersWidget(),
                  SizedBox(height: mediaQueryHeight(context)*.025,),
                  PharmaciesWidget()


                ],),
              ),
            ),
          ),
        ),
        // HomeScreen
      ),
    );
  }
}
