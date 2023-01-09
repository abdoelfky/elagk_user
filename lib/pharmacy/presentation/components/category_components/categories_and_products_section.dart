import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_departments.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_products.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class CategoriesAndProductsSection extends StatelessWidget {
  CategoriesAndProductsSection({Key? key,
    required this.firstCategoryName,
    required this.pharmacyId})
      : super(key: key);

  final String firstCategoryName;
  final int pharmacyId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        PharmacyCategories(pharmacyId: pharmacyId,),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s15),
        PharmacyProducts(
          firstCategoryName: firstCategoryName,
          pharmacyId: pharmacyId,
        ),
      ],
    );
  }
}
