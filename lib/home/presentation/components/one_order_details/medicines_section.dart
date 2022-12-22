import 'package:elagk/home/presentation/components/one_order_details/one_order_items.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/argument_models.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

class MedicinesSection extends StatelessWidget {
  const MedicinesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // medicines
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            AppStrings.medicines,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        const SizedBox(height: 20),
        if (true) // TODO: remove this line condition.
        // if (cubit.oneOrderModel!.data!.type!.toInt() == 0)
        //   if (cubit.oneOrderModel!.data!.description != null)
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Test", // TODO.
                // cubit.oneOrderModel!.data!.description.toString(),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeightManager.bold,
                    ),
              ),
            ),
        if (true) // TODO: remove this line condition.
        // if (cubit.oneOrderModel!.data!.type!.toInt() == 0)
        //   if (cubit.oneOrderModel!.data!.photo != null)
            ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return OneOrderItems(
                  onPressed: () => navigateTo(
                    context: context,
                    screenRoute: Routes.imageSlideShow,
                    arguments: const ImageSlideShowArguments(
                      // image: cubit.oneOrderModel!.data!.photo.toString(), // TODO.
                      image: "Test",
                    ),
                  ),
                  imageSrc: "Test", // TODO.
                  // cubit.oneOrderModel!.data!.photo.toString(),
                  index: index,
                );
              },
            ),
      ],
    );
  }
}
