import 'package:dotted_border/dotted_border.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AddPrescriptionImage(context) => InkWell(
      onTap: () {},
      child: DottedBorder(
        color: Colors.green,
        dashPattern: [8, 8],
        radius: Radius.circular(20),
        strokeWidth: 2,
        customPath: (size) {
          return Path()
            ..moveTo(20, 0)
            ..lineTo(size.width - 20, 0)
            ..arcToPoint(Offset(size.width, 20), radius: Radius.circular(20))
            ..lineTo(size.width, size.height - 20)
            ..arcToPoint(Offset(size.width - 20, size.height),
                radius: Radius.circular(20))
            ..lineTo(20, size.height)
            ..arcToPoint(Offset(0, size.height - 20),
                radius: Radius.circular(20))
            ..lineTo(0, 20)
            ..arcToPoint(Offset(20, 0), radius: Radius.circular(20));
        },
        child: Container(
          width: double.infinity,
          height: AppSize.s100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromRGBO(241, 248, 255, 1)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Image.asset(
                  'assets/images/drawer_icons/addPhoto.png',
                  width:  AppSize.s40,),
                SizedBox(width: mediaQueryWidth(context) / AppSize.s30),
                Text(AppStrings.addPrescriptionImage,style: Theme.of(context).textTheme.displayLarge,),

              ],
            ),
          ),
        ),
      ),
    );
