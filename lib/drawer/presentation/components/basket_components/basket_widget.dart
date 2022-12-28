import 'package:flutter/material.dart';
import 'basket_products.dart';
import 'basket_salary.dart';

class BasketSection extends StatelessWidget {
  const BasketSection({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BasketProducts(
          firstCategoryName: firstCategoryName,
        ),
        const BasketSalary(),
      ],
    );
  }
}
