import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/pharmacy/pharmacy_info.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../auth/presentation/components/screen_background.dart';
import '../shared/global/app_colors.dart';
import '../shared/utils/app_assets.dart';
import '../shared/utils/app_strings.dart';
import '../shared/utils/app_values.dart';
import 'categories_and_products_section.dart';
import 'pharmacy_appBar.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(

      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          appBar:  pharmacyAppBar(

            context: context,
            title: AppStrings.pharmacyName,
            actionWidget: const AppBarBasketIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
          ),
          body: ScreenBackground(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: AppSize.s200,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Pharmacy photo
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: mediaQueryWidth(context),
                            height: AppSize.s170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSize.s8,
                              ),
                            ),
                            child: const DefaultNetworkImage(
                              imageSrc: 'assets/images/profile/download(4)@3x.png',
                              height: double.infinity,
                              width: double.infinity,
                              padding: AppPadding.p0,
                            ),
                          ),
                        ),
                        // Pharmacy information
                        const PharmacyInformation(),
                      ],
                    ),
                  ),
              const CategoriesAndProductsSection(
                firstCategoryName: "categoryName",
              ),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s30),

                  SizedBox(
                      width: double.infinity,
                      height: AppSize.s60,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppPadding.p15),
                        ),
                        onPressed: () =>
                        {

                        },
                        color:AppColors.offBlue,
                        child: Row(
                          children: [
                            SizedBox(width: mediaQueryWidth(context) / AppSize.s5),
                            Text(AppStrings.prescriptionAndDeliverPrice,
                                style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            SizedBox(width: mediaQueryWidth(context) / AppSize.s20),
                            Image.asset(
                                ImageAssets.importImage,
                              color: AppColors.shadow,
                            width:  AppSize.s50,),
                          ],
                        ),
                      ))

                 /* BlocBuilder<CategoriesBloc, CategoriesState>(
                    builder: (context, state) {
                      switch (state.categoryRequestState) {
                        case RequestState.loading:
                          return const Center(child: Text(AppStrings.noProducts));
                        case RequestState.loaded:
                          return CategoriesAndProductsSection(
                            firstCategoryName: state.category!.first.categoryName,
                          );
                        case RequestState.error:
                          return const PharmacyProductsBar();
                      }
                    },
                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
