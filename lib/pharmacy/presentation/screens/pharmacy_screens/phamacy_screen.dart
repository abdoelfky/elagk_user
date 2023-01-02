import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/presentation/components/OrderByPrescriptionComponents/OrderByPrescriptionContent.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/item.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_state.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_info.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/components/second_appBar.dart';

class PharmacyScreen extends StatelessWidget {
  final PharmacyModel? pharmacyModel;

// final String? pharmacyLocation;

  PharmacyScreen({
    Key? key,
    this.pharmacyModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          appBar: SecondAppBar(
            context: context,
            title: pharmacyModel!.pharmacyName!,
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
            actionWidget: const AppBarBasketIcon(),
          ),
          body: BlocConsumer<CategoriesCubit, CategoriesStates>(
            listener: (context, state) {},
            builder: (context, state) {
              if (AppConstants.pharmacyLocation == '') {
                CategoriesCubit.get(context).getLocation(
                    pharmacyModel!.latitude, pharmacyModel!.longitude);
              }
              if (AppConstants.distance == '') {
                CategoriesCubit.get(context).getDistance(
                    pharmacyModel!.latitude, pharmacyModel!.longitude);
              }
              return ScreenBackground(
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
                                  imageSrc:
                                      'assets/images/profile/download (4).png',
                                  height: double.infinity,
                                  width: double.infinity,
                                  padding: AppPadding.p0,
                                ),
                              ),
                            ),
                            // Pharmacy information
                            PharmacyInformation(
                              distance: AppConstants.distance,
                              pharmacyModel: pharmacyModel,
                              pharmacyLocation: AppConstants.pharmacyLocation,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HomeScreenItem(
                              image: 'assets/images/make-up.jpg',
                              name: AppStrings.cost,
                              SuperCategoryId: 1,
                              pharmacyModel: pharmacyModel!,
                            ),
                            SizedBox(
                                width: mediaQueryHeight(context) / AppSize.s18),
                            HomeScreenItem(
                              image: 'assets/images/medicine.jpg',
                              name: AppStrings.medicine,
                              SuperCategoryId: 2,
                              pharmacyModel: pharmacyModel!,
                            ),
                          ]),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.si6),
                      SizedBox(
                          width: double.infinity,
                          height: AppSize.s60,
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppPadding.p15),
                            ),
                            onPressed: () => {
                              navigateTo(
                                  context: context,
                                  screenRoute: Routes.orderByPrescription,
                                  arguments: pharmacyModel)
                            },
                            color: AppColors.offBlue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.prescriptionAndDeliverPrice,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                SizedBox(
                                    width:
                                        mediaQueryWidth(context) / AppSize.s30),
                                Image.asset(
                                  ImageAssets.importImage,
                                  color: AppColors.shadow,
                                  width: AppSize.s50,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
