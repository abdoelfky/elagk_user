import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget SpecialCustomerInfo(context) => Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
      ),
  child: Padding(
    padding: const EdgeInsets.all(AppPadding.p8),
    child: Row(children:
    [

      Container(
        width: 75,
        height:75,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              width: 2,
              color: AppColors.lightGrey,
            )),
        child: Center(
          child: Image(
            image: AssetImage(
              'assets/images/menu/profile.png',
            ),
            width: 75,
            height: 75,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(width: 20,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('عمر ابراهيم',
          style: TextStyle(color: Colors.white,
              fontWeight:FontWeight.bold ,fontSize: 18)),
        Text('المبلغ: 800\$',
            style: TextStyle(color: Colors.white,
                fontWeight:FontWeight.bold ,fontSize: 18)),
      ],),
      Spacer(),
      Text('200 نقطه',
          style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold ,fontSize: 18)),



    ],),
  ),
    );
