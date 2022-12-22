import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/services/services_locator.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/argument_models.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/error_screen.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/pharmacy_user_profile/product_item_pharmacy_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/categories_controller/categories_bloc.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmacyProducts extends StatefulWidget {
  const PharmacyProducts({Key? key, required this.firstCategoryName}) : super(key: key);

  final String firstCategoryName;

  @override
  State<PharmacyProducts> createState() => _PharmacyProductsState();
}

class _PharmacyProductsState extends State<PharmacyProducts> {
  @override
  void initState() {
    BlocProvider.of<CategoriesBloc>(context).add(
      GetMedicinesEvent(categoryName: widget.firstCategoryName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        switch (state.medicinesRequestState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          case RequestState.loaded:
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: AppSize.s150,
                childAspectRatio: AppSize.s7 / AppSize.s10,
                crossAxisSpacing: AppSize.s10,
                mainAxisSpacing: AppSize.s10,
              ),
              itemCount: state.medicines!.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductItemPharmacy(
                  productName: state.medicines![index].productName,
                  productPrice: state.medicines![index].price.toString(),
                  imageSrc: state.medicines![index].imageUrl ?? AppConstants.empty,
                  onTap: () {
                    // BlocProvider.of<MedicineBloc>(context).add(GetMedicineEvent(state.medicines![index].productId));
                     navigateTo(
                      context: context,
                      screenRoute: Routes.updateMedicineScreen,
                      arguments: UpdateMedicineArguments(
                        productId: state.medicines![index].productId,
                        productName: state.medicines![index].productName,
                        description: state.medicines![index].description!,
                        imageUrl: state.medicines![index].imageUrl!,
                        price: state.medicines![index].price,
                        discountPercent: state.medicines![index].discountPercent,
                        categoryId: state.medicines![index].categoryId,
                        categoryName: state.medicines![index].categoryName, // TODO: change it in medicine model to String instead of String?.
                        quantity: state.medicines![index].quantity!,
                        dose: state.medicines![index].dose ?? AppConstants.empty, // TODO: handle it.
                      ),
                    );
                  },
                );
              },
            );
          case RequestState.error:
            return const ErrorScreen();
        }
      },
    );
  }
}
