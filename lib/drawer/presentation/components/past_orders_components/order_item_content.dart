import 'package:elagk/drawer/data/models/past_orders_model.dart';
import 'package:elagk/drawer/presentation/controller/stepper_controller/stepper_cubit.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget OrderItem(
        {required context,
        required PastOrdersModel pastOrder,
        required bool isActive}) =>
    InkWell(
      onTap: () {
        // print(pastOrder.isRejected!);


          StepperCubit.get(context).followOrder(orderId: pastOrder.orderId);
          navigateTo(
              context: context,
              screenRoute: Routes.stepperScreen,
              arguments: pastOrder.orderId);

      },
      child: Container(
        height: 80,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/order/order.png',
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('الطلب رقم ' + pastOrder.orderId.toString(),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: mediaQueryWidth(context) * 0.24,
                    ),
                    pastOrder.isRejected!
                        ? Text(AppStrings.cancelledOrder,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.red)):
                    !isActive ?Text(AppStrings.activeOrder,
                            style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))

                            : Text(AppStrings.doneOrder,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade500)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        '${DateFormat("yyyy-MM-dd-hh:mm").format(DateTime.parse(pastOrder.createdAt.toString()))}',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade500)),
                    SizedBox(
                      width: mediaQueryWidth(context) * 0.19,
                    ),
                    Text(pastOrder.totalPrice.toString() + ' جنيه ',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade500)),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
