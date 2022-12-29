import 'package:flutter/material.dart';
import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_strings.dart';
import '../../../../shared/utils/app_values.dart';
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
        SizedBox(
            width: double.infinity,
            height: AppSize.s60,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppPadding.p15),
              ),
              onPressed: () => {

              },
              color:AppColors.offBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(AppStrings.buy,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
