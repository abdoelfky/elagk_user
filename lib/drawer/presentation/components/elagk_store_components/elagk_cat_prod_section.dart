import 'package:elagk/drawer/presentation/components/elagk_store_components/elagk_store_categories_component.dart';
import 'package:elagk/drawer/presentation/components/elagk_store_components/elagk_store_products_component.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class ElagkStoreCategoriesAndProductsSection extends StatelessWidget {
  ElagkStoreCategoriesAndProductsSection({Key? key,})
      : super(key: key);


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
        ElagkStoreCategories(),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s15),
        ElagkStoreProducts(),
      ],
    );
  }
}
