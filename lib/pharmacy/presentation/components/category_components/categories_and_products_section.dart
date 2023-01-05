import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_departments.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_products.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class CategoriesAndProductsSection extends StatelessWidget {
  CategoriesAndProductsSection({Key? key, required this.firstCategoryName,
    required this.pharmacyId})
      : super(key: key);

  final String firstCategoryName;
  final int pharmacyId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.all(AppPadding.p6),
          child: Text(
            AppStrings.products,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s30),
        // categories & products.
        PharmacyCategories(),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s15),
        PharmacyProducts(
          firstCategoryName: firstCategoryName,
          pharmacyId: 0,
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
