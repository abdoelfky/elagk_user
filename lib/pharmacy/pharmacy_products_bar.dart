
import 'package:flutter/material.dart';

import '../shared/utils/app_routes.dart';
import '../shared/utils/app_strings.dart';
import '../shared/utils/app_values.dart';
import '../shared/utils/navigation.dart';

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
