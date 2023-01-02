import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import '../../../../auth/presentation/components/MainTextFormField.dart';

class BasketSalary extends StatelessWidget {
  const BasketSalary({Key? key}) : super(key: key);
  static final _discountController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.addDiscountCode,style: Theme.of(context).textTheme.displayLarge,),
          const SizedBox(height: 20,),

          MainTextFormField(
            controller: _discountController,
            label: AppStrings.discountCode,
            hint: AppStrings.discountCodeExample,
            hintColor: Colors.white,
            focusColor: Colors.white,
            inputType: TextInputType.visiblePassword,
            textDirection: TextDirection.ltr,
            obscure: false,
            icon: InkWell(
              onTap: (){},
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green[700]
                ),
                child: const Center(child:
                Text(AppStrings.active,style: TextStyle
                  (
                    fontSize: 17,fontWeight:FontWeight.bold ,color: Colors.white
                ),)),
              ),
            ),
            validator: (value) {
              // if (value!.length < AppSize.s8) {
              //   return AppStrings.enterValidPassword;
              // } else {
              //   return null;
              // }
            },
          ),

          const SizedBox(height: 20,),
          Row(
            children:  [

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
          DottedLine(
              dashColor: Colors.grey,
              dashLength: 11, dashGapLength: 10),
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
