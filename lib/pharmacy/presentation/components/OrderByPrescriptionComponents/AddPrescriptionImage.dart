import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/orderByPerscripiyion_controller/order_by_perscripiyion_cubit.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AddPrescriptionImage(context) => InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) {
              Future.delayed(Duration(seconds: 4), () {
                Navigator.of(context).pop(true);
              });
              return AlertDialog(
                elevation: 50.0,
                actions: [
                  CupertinoDialogAction(
                    child: const Text(
                      'Gallary',
                      style: TextStyle(color: Colors.green),
                    ),
                    onPressed: () {
                      OrderByPerscripiyionCubit.get(context).pickMedia();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text('Camera',
                        style: TextStyle(color: AppColors.primary)),
                    onPressed: () {
                      OrderByPerscripiyionCubit.get(context).pickMediaCamera();
                    },
                  ),
                ],
              );
            });
      },
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
              children: [
                (OrderByPerscripiyionCubit.get(context).imagePath != null)
                    ? Container(
                        width: AppSize.s90,
                        height: AppSize.s90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              width: 2,
                              color: AppColors.primary,
                            )),
                        child: Image.file(
                          File(OrderByPerscripiyionCubit.get(context)
                              .imagePath!),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        'assets/images/drawer_icons/addPhoto.png',
                        width: AppSize.s40,
                      ),
                SizedBox(width: mediaQueryWidth(context) / AppSize.s30),
                Text(
                  AppStrings.addPrescriptionImage,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
