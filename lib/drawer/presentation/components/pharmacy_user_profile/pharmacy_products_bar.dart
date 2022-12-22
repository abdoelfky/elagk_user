import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:flutter/material.dart';

class PharmacyProductsBar extends StatelessWidget {
  const PharmacyProductsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p15),
      child: Row(
        children: [
          Text(
            AppStrings.products,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
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
            child: const Icon(Icons.add_circle_outline),
          )
        ],
      ),
    );
  }
}
