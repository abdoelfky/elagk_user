import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pharmacy_categories.dart';

class PharmacyCategories extends StatelessWidget {
  const PharmacyCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyProductiesCubit, PharmacyProductiesStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: AppSize.s40,
          color: Colors.transparent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: PharmacyProductiesCubit.get(context).categories.length,
            itemBuilder: (BuildContext context, int index) {

              return Categories(
                onTap: () {
                  PharmacyProductiesCubit.get(context).changeSelectedCategory(
                      selectedCategory: PharmacyProductiesCubit.get(context)
                          .categories[index]
                          .categoryName!);
                },
                categoryName: PharmacyProductiesCubit.get(context)
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
