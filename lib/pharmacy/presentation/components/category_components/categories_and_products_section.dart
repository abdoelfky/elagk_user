
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_departments.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_products.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_products_bar.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../shared/components/second_appBar.dart';

class CategoriesAndProductsSection extends StatelessWidget {
  const CategoriesAndProductsSection({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PharmacyProductsBar(),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s30),
        // categories & products.
       const PharmacyCategories(),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s15),
        PharmacyProducts(
          firstCategoryName: firstCategoryName,
        ),

        /* if (cubit.profileMedicines!.paginate!.currentPage!.toInt()
         <cubit.profileMedicines!.paginate!.lastPage!.toInt()) */
        // down arrow button.
        /*Padding(
          padding: const EdgeInsets.all(AppPadding.p6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                // () => cubit.getPharmacyProfileMedicines((cubit.profileMedicines!.paginate!.currentPage + 1).toInt(),
                // true,
                // CacheHelper.getData(key: 'id'),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      AppSize.s50,
                    ),
                  ),
                  child: const Icon(
                    Icons.expand_circle_down,
                    size: AppSize.s35,
                  ),
                ),
              )
            ],
          ),
        )*/
      ],
    );
  }
}
