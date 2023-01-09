import 'package:elagk/basket/presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/drawer/presentation/components/points_components/points_items_widget.dart';
import 'package:elagk/drawer/presentation/controller/points_controller/points_cubit.dart';
import 'package:elagk/shared/components/na_data_widget.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/app_values.dart';


class PointsProducts extends StatelessWidget {
  const PointsProducts({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;


  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointsCubit, PointsState>(
      builder: (context, state) {
        if(state is GetPointProductsLoadingState)
        {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: mediaQueryHeight(context)*.2),
            child:
          CircularProgressIndicator(color: AppColors.primary,),);
        }
        else if(PointsCubit.get(context).products.isNotEmpty)
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppSize.s150,
            childAspectRatio: AppSize.s7 / AppSize.s10,
            crossAxisSpacing: AppSize.s10,
            mainAxisSpacing: AppSize.s10,
          ),
          itemCount: PointsCubit.get(context).products.length,
          itemBuilder: (BuildContext context, int index) {
            return PointsPharmacy(
              categoriesName:PointsCubit.get(context).products[index]
                  .productName!,
              points: PointsCubit.get(context).products[index]
                  .point!,
              imageSrc: PointsCubit.get(context).products[index]
                  .imageUrl!,
              onTap: ()
              {
                if(PointsCubit.get(context).userPoints >
                    PointsCubit.get(context)
                        .products[index].point!
                ){
                if(BasketCubit.get(context).pharmacyId==58
                    ||BasketCubit.get(context).pharmacyId==null)
                {
                  BasketCubit.get(context).AddToCart(
                      productModel:
                      PointsCubit.get(context)
                          .products[index],
                      phId: 58,
                      dist:0);
                  PointsCubit.get(context).changeUserPoints(productPoint:

                  PointsCubit.get(context)
                      .products[index].point!,
                  );
                }
                else
                {
                  BasketCubit.get(context).deleteCartProducts();
                  BasketCubit.get(context).AddToCart(
                      productModel:
                      PointsCubit.get(context)
                          .products[index],
                      phId: 58,
                      dist: 0);
                  PointsCubit.get(context).changeUserPoints(
                    productPoint:
                  PointsCubit.get(context)
                      .products[index].point!,
                  );

                }

                }
              }, userPoints: PointsCubit.get(context).userPoints,
            );
          },
        );
        else return NoDataWidget(AppStrings.noPointsProductes);
      },
    );
  }
}
