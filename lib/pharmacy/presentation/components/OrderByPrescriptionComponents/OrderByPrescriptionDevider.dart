import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget OrderByPrescriptionDivider(context)=>Padding(
  padding:  EdgeInsets.symmetric(horizontal:2),
  child:   Row(
    children: [
      Container(
        width: mediaQueryWidth(context)*.35,
        height: 2,
        color: AppColors.lightGrey.withOpacity(0.4),
      ),
      Spacer(),
      Text('أو',style: Theme.of(context).textTheme.displayLarge,),
      Spacer(),
      Container(
        width: mediaQueryWidth(context)*.35,
        height: 2,
        color: AppColors.lightGrey.withOpacity(0.4),
      ),

    ],
  ),
);