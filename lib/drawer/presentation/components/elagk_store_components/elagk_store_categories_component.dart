import 'package:elagk/drawer/presentation/controller/elagk_store_controller/elagk_store_cubit.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_categories.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElagkStoreCategories extends StatelessWidget {
  const ElagkStoreCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElagkStoreCubit, ElagkStoreState>(
      listener: (context, state) {
        if(state is GetElagkStoreCategoriesSuccessState)
        {
          ElagkStoreCubit.get(context).getProducts(pharmacyId: 58,
              categoryName: ElagkStoreCubit.get(context)
                  .categories[0]
                  .categoryName!);
        }
      },
      builder: (context, state) {
        return Container(
          height: AppSize.s40,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ElagkStoreCubit.get(context).categories.length,
            itemBuilder: (BuildContext context, int index) {

              return Categories(
                onTap: () {
                  ElagkStoreCubit.get(context).changeSelectedCategory(
                      selectedCategory: ElagkStoreCubit.get(context)
                          .categories[index]
                          .categoryName!);

                  ElagkStoreCubit.get(context).getProducts(pharmacyId: 58,
                      categoryName: ElagkStoreCubit.get(context)
                          .categories[index]
                          .categoryName!);
                },
                categoryName: ElagkStoreCubit.get(context)
                    .categories[index]
                    .categoryName!,
                containerColor: Color(0xff1d71b8),
                textColor: Colors.white,
                borderColor: Border.all(color: AppColors.lightGrey),
              );
            },
          ),
        );
      },
    );
  }
}
