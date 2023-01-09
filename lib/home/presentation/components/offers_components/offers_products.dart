import 'package:elagk/home/presentation/components/offers_components/home_offer_component.dart';
import 'package:elagk/home/presentation/components/offers_components/offers_items_widget.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/offer_component.dart';
import 'package:elagk/shared/components/na_data_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/app_values.dart';


class OffersProducts extends StatelessWidget {
  const OffersProducts({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;


  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        if(state is GetOfferProductsLoadingState)
        {
          return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
        }
        else if (state is GetOfferProductsSuccessState
            &&HomeScreenCubit.get(context).offerProducts.isNotEmpty ){
          return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppSize.s150,
            childAspectRatio: AppSize.s7 / AppSize.s10,
            crossAxisSpacing: AppSize.s10,
            mainAxisSpacing: AppSize.s10,
          ),
          itemCount: HomeScreenCubit.get(context).offerProducts.length,
          itemBuilder: (BuildContext context, int index) {
            return HomeOfferComponent(offerModel:HomeScreenCubit.get(context)
                .offerProducts[index] ,);
          },
        );
        }
        else
        {
          return Center(child: NoDataWidget(AppStrings.noProductsOffers));
        }
      },
    );
  }
}
