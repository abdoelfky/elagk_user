import 'package:elagk/home/presentation/components/one_order_details/edit_price_dialog.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class EditingPriceDetails extends StatelessWidget {
  const EditingPriceDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => const EditPriceDialog(), // TODO.
            );
          },
          child: Container(
            width: AppSize.s120,
            height: AppSize.s50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s5),
              color: AppColors.offWhite,
            ),
            child: Center(
                child: Text(
              AppStrings.equipped,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: AppColors.primary,
                  ),
            )),
          ),
        ),
        const SizedBox(width: 15), // TODO.
        InkWell(
          onTap: (){},
              // () => cubit.reportOrder(cubit.oneOrderModel!.data!.id.toString(), context),
          child: Container(
            width: AppSize.s120,
            height: AppSize.s50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s5),
              color: AppColors.offWhite,
            ),
            child: Center(
              child: Text(
                AppStrings.refuseOrAnnoy,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
