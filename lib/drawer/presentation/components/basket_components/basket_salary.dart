
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/app_strings.dart';

class BasketSalary extends StatelessWidget {
  const BasketSalary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        children: [
          Row(
            children: const [
              Text(
                "السعر",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              Spacer(),
              Text(
                "150 جنية",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ],
          ),
          SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
          Row(
            children: const [
              Text(
                "الديلفري",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              Spacer(),
              Text(
                "15 جنية",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ],
          ),
          SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
           Divider(

           ),
          SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
          Row(
            children: const [
              Text(
                "اجمالي السعر",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
              Spacer(),
              Text(
                "165 جنية",

                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,color: Colors.green
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
