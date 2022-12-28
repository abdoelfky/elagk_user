import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_products_bar.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/app_values.dart';
import 'offers_products.dart';


class OffersSection extends StatelessWidget {
  const OffersSection({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PharmacyProductsBar(),
        OffersProducts(
          firstCategoryName: firstCategoryName,
        ),
      ],
    );
  }
}
