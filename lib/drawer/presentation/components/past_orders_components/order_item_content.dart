
import 'package:elagk/drawer/data/past_orders_model.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget OrderItem({required context,required PastOrdersModel pastOrder}) =>
    Container(
      height: 80,
      width: double.infinity,
      child: Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        children:
        [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child:
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:Image.asset(
                  'assets/images/order/order.png',
                ),

              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              Text( 'الطلب رقم '+pastOrder.orderId.toString(), style: TextStyle
                (
                  fontSize: 18,
                  fontWeight: FontWeight.bold

              )),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(

                      '${DateFormat("yyyy-MM-dd").format(DateTime.parse(
                          pastOrder.createdAt.toString()))}', style:
                  TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500

                  )),
                  SizedBox(width: mediaQueryWidth(context) * 0.24,),
                  Text(pastOrder.totalPrice.toString() + ' جنيه ', style:
                  TextStyle
                    (
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500

                  )),

                ],
              )
            ],
          )
        ],
      ),
    );



