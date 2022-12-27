
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/app_strings.dart';

class PharmacyProductsBar extends StatelessWidget {
  const PharmacyProductsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              debugPrint("cubit.getAllMedicines();");
              // cubit.getAllMedicines(); // TODO.
              debugPrint("navigateTo(context, AddNewMedicines());");
              navigateTo(
                context: context,
                screenRoute: Routes.addNewMedicinesScreen,
              );
            },
            child: const Icon(Icons.keyboard_control),
          ),
          const Spacer(),
          Text(
            AppStrings.products,
            style: Theme.of(context).textTheme.displayLarge,
          ),


        ],
      ),
    );
  }
}
