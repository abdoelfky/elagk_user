import 'package:elagk/basket/data/basket_model.dart';
import 'package:elagk/drawer/presentation/components/elagk_store_components/elagk_store_offer_component.dart';
import 'package:elagk/drawer/presentation/components/elagk_store_components/elagk_store_product_component.dart';
import 'package:elagk/drawer/presentation/controller/elagk_store_controller/elagk_store_cubit.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/product_component.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/offer_component.dart';
import 'package:elagk/shared/components/na_data_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElagkStoreProducts extends StatelessWidget {
  ElagkStoreProducts({Key? key}): super(key: key);

  BasketModel? basketModel;

  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElagkStoreCubit, ElagkStoreState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is SearchDoneSuccessState &&
            ElagkStoreCubit.get(context)
                .searchResult.isNotEmpty) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: AppSize.s150,
              childAspectRatio: AppSize.s7 / AppSize.s10,
              crossAxisSpacing: AppSize.s10,
              mainAxisSpacing: AppSize.s10,
            ),
            itemCount: ElagkStoreCubit.get(context)
                .searchResult.length,
            itemBuilder: (BuildContext context, int index) {
              if (ElagkStoreCubit.get(context)
                  .searchResult[index]
                  .discountPercent ==
                  0.0) {
                return ElagkStoreProductComponent(
                  index: index,
                  pharmacyId: 58,
                  search: true,
                );
              } else {
                return ElagkStoreOfferComponent(
                  index: index,
                  pharmacyId: 58, search: true,
                );
              }
            },
          );
        }
        else if (ElagkStoreCubit.get(context)
            .products.isNotEmpty) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: AppSize.s150,
              childAspectRatio: AppSize.s7 / AppSize.s10,
              crossAxisSpacing: AppSize.s10,
              mainAxisSpacing: AppSize.s10,
            ),
            itemCount: ElagkStoreCubit.get(context)
                .products.length,
            itemBuilder: (BuildContext context, int index) {
              if (ElagkStoreCubit.get(context)
                  .products[index]
                  .discountPercent ==
                  0.0) {
                return ElagkStoreProductComponent(
                  index: index,
                  pharmacyId: 58,
                  search: false,
                );
              } else {
                return ElagkStoreOfferComponent(
                  index: index,
                  pharmacyId: 58,
                  search: false,
                );
              }
            },
          );
        }
        else if(state is GetElagkStoreProductiesLoadingState)
          return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ));
        else {
          return Center(
              child: Padding(
                padding:
                EdgeInsets.symmetric(vertical: mediaQueryHeight(context) * .1),
                child: NoDataWidget(AppStrings.noProducts),
              ));
        }
      },
    );
  }
}
