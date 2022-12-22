
import 'package:elagk/drawer/presentation/components/pharmacy_user_profile/pharmacy_info.dart';
import 'package:elagk/drawer/presentation/components/pharmacy_user_profile/pharmacy_products_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/components/screen_background.dart';
import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_constants.dart';
import '../../../../shared/utils/app_strings.dart';
import '../../../../shared/utils/app_values.dart';
import '../../../../shared/utils/enums.dart';
import '../../controller/categories_controller/categories_bloc.dart';
import '../../controller/pharmacy_user_profile_controller/pharmacy_profile_bloc.dart';
import '../default_network_image_widget.dart';
import '../fixed_appbar_widget.dart';
import 'categories_and_products_section.dart';

class PharmacyUserProfileContent extends StatelessWidget {
  const PharmacyUserProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<PharmacyProfileBloc, PharmacyProfileState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.offWhite,
            appBar: fixedAppBar(
              context: context,
              title: state.pharmacyUser!.pharmacyName ?? AppConstants.empty,
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
                              height: AppSize.s180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s8,
                                ),
                              ),
                              child: DefaultNetworkImage(
                                imageSrc: state.pharmacyUser!.imageUrl!,
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
                    BlocBuilder<CategoriesBloc, CategoriesState>(
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
                        }return const PharmacyProductsBar();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
