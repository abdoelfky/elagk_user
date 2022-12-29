import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

import 'pharmacy_categories.dart';

class PharmacyCategories extends StatelessWidget {
  const PharmacyCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s40,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Categories(
            onTap: () {
            },

            categoryName: 'shefo',
            containerColor:
                Color(0xff1d71b8),
            textColor:  Colors.white,
            borderColor:  Border.all(color: AppColors.lightGrey),
          );
        },
      ),
    );
  }
}
