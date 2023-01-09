import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/home/data/models/offer_product_model.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/home/presentation/components/offers_components/offers_widget.dart';
import 'package:elagk/home/presentation/components/search_widget.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';




class OffersScreen extends StatelessWidget {
  const OffersScreen({
    Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: SecondAppBar(
            context: context,
            title: AppStrings.offers,
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
            actionWidget: const AppBarBasketIcon(),
          ),
          backgroundColor: AppColors.offWhite,
          body: ScreenBackground(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: AppPadding.p20,
                right:AppPadding.p20 ,
                  left :AppPadding.p20),
              child: OffersSection(
                firstCategoryName: "categoryName",
              ),


            ),
          ),
        ),
      ),
    );
  }
}
