import 'package:elagk/shared/utils/app_strings.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(AppPadding.p6),
          child: Text(
            AppStrings.products,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        OffersProducts(
          firstCategoryName: firstCategoryName,
        ),
      ],
    );
  }
}
