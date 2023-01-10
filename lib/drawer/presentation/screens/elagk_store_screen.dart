import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/elagk_store_components/elagk_cat_prod_section.dart';
import 'package:elagk/drawer/presentation/components/elagk_store_components/elagk_store_search.dart';
import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/pharmacy/presentation/components/OrderByPrescriptionComponents/OrderByPrescriptionContent.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/categories_and_products_section.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/search_categories.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';


class ElagkStoreScreen extends StatelessWidget {
  const ElagkStoreScreen({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ScreenBackground(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar:  fixedAppBar(
            context: context,
            title: AppStrings.elagkStore,
            actionWidget: const AppBarBasketIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
          ),

          backgroundColor: AppColors.offWhite,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(AppPadding.p20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s220,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Pharmacy photo
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSize.s8,
                              ),
                              gradient:const LinearGradient(
                                  begin:Alignment.topRight ,
                                  end:Alignment.bottomRight ,
                                  colors:
                                  [
                                    Color(0xff137e8f),
                                    Color(0xff059053),
                                  ])
                          ),
                          width: mediaQueryWidth(context),
                          height: AppSize.s300,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: AppSize.s35,
                              ),
                              const Center(
                                child: Text(
                                  AppStrings.searchFor,
                                  style: TextStyle(
                                      fontSize: 25,color: Colors.white
                                  ),
                                ),
                              ),
                              ElagkStoreSearch(),
                            ],
                          ),


                        ),
                      ),                   // Pharmacy information
                    ],
                  ),
                ),
                SizedBox(
                    height: mediaQueryHeight(context) / AppSize.s40),
                ElagkStoreCategoriesAndProductsSection(),
              ],

            ),


          ),
        ),
      ),
    );
  }
}
