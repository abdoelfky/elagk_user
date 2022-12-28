import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

import 'special_customer_info.dart';


class SpecialCustomersContent extends StatelessWidget {
  const SpecialCustomersContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p15),
          child: ListView.separated(
      shrinkWrap: true,
      itemCount: 40,
      itemBuilder: (context, index) {

          return SpecialCustomerInfo(context);

      },
            separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10,),
    ),
        ));
  }
}
