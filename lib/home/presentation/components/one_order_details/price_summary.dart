import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class PriceSummary extends StatelessWidget {
  const PriceSummary({
    Key? key,
    required this.totalPrice,
    required this.couponAmount,
    required this.priceAfterOffer,
  }) : super(key: key);
  final String totalPrice;
  final dynamic couponAmount;
  final String priceAfterOffer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              AppStrings.price,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            Text(
              "$totalPrice${AppStrings.pound}",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        const SizedBox(height: 10), // TODO.
        Row(
          children: [
            Text(
              AppStrings.discount,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            Text(
              couponAmount == AppStrings.isNull
                  ? AppStrings.nA
                  : "$couponAmount${AppStrings.pound}",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        const SizedBox(height: 10), // TODO.
        /* Row(
          children: [
            const Text(AppStrings.delivery,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
            const Spacer(),
            Text("$deliveryPrice${AppStrings.pound}",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ],
        ),*/
        const SizedBox(height: 25), // TODO.
        Container(
            margin: const EdgeInsets.only(left: AppMargin.m10, right: AppMargin.m20),
            child: const Divider(
              color: Colors.black,
              height: AppSize.s36,
            )),
        Row(
          children: [
            Text(
              AppStrings.total,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const Spacer(),
            Text("$priceAfterOffer${AppStrings.pound}",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: AppColors.lightGreen,
                    )),
          ],
        )
      ],
    );
  }
}
