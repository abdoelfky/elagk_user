import 'package:elagk/drawer/presentation/components/points_components/points_products_bar.dart';
import 'package:flutter/material.dart';
import 'points_products.dart';


class PointsSection extends StatelessWidget {
  const PointsSection({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PointsProductsBar(),
        PointsProducts(
          firstCategoryName: firstCategoryName,
        ),
      ],
    );
  }
}
