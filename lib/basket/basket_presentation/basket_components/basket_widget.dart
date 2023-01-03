import 'package:elagk/basket/basket_presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/basket/basket_presentation/basket_controller/basket_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocBuilder<BasketCubit, BasketStates>(
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              BasketProducts(
                firstCategoryName: firstCategoryName,
              ),
              BasketSalary(totalPrice: BasketCubit.get(context).totalPrice,),
              SizedBox(
                  width: double.infinity,
                  height: AppSize.s60,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppPadding.p15),
                    ),
                    onPressed: () =>
                    {
                    },
                    color: AppColors.offBlue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text(AppStrings.buy,
                          style: Theme
                              .of(context)
                              .textTheme
                              .headlineMedium,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
