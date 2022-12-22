import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class CustomerInfo extends StatelessWidget {
  const CustomerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // customer info text
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.customerInfo,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeightManager.bold,
            ),
          ),
        ),
        // customer name
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Test", // TODO.
            // "${AppStrings.customer}${cubit.oneOrderModel!.data!.client!.name.toString()}",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeightManager.regular,
            ),
          ),
        ),
        // customer address
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Test", // TODO.
            // "${AppStrings.addressIs}${cubit.oneOrderModel!.data!.address.toString()}",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeightManager.regular,
            ),
          ),
        ),
        const SizedBox(height: 20), // TODO.
      ],
    );
  }
}
