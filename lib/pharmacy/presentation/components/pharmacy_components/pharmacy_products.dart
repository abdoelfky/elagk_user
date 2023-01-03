import 'package:elagk/basket/basket_presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/basket/data/basket_model.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/offer_component.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/product_component.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/components/na_data_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/app__fonts.dart';
import 'product_item_pharmacy_widget.dart';

class PharmacyProducts extends StatelessWidget {
  PharmacyProducts(
      {Key? key, required this.firstCategoryName, required this.pharmacyId})
      : super(key: key);

  final String firstCategoryName;
  final int pharmacyId;
  BasketModel? basketModel;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyProductiesCubit, PharmacyProductiesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is! GetProductiesSuccessState) {
          PharmacyProductiesCubit.get(context).getProducties(
              pharmacyId: pharmacyId,
              categoryName:
                  PharmacyProductiesCubit.get(context).selectedCategoryName);
        }

        if (state is GetProductiesSuccessState &&
            PharmacyProductiesCubit.get(context).producties.isNotEmpty) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: AppSize.s150,
              childAspectRatio: AppSize.s7 / AppSize.s10,
              crossAxisSpacing: AppSize.s10,
              mainAxisSpacing: AppSize.s10,
            ),
            itemCount: PharmacyProductiesCubit.get(context).producties.length,
            itemBuilder: (BuildContext context, int index) {
              if (PharmacyProductiesCubit.get(context)
                      .producties[index]
                      .discountPercent == 0.0) {
                return ProductComponent(index: index,);
              } else {
                return OfferComponent(index: index,);
              }
            },
          );
        } else if (state is GetProductiesSuccessState &&
            PharmacyProductiesCubit.get(context).producties.isEmpty)
          return Center(
              child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: mediaQueryHeight(context) * .1),
            child: NoDataWidget(AppStrings.noProducts),
          ));
        else
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primary,
          ));
      },
    );
  }
}
