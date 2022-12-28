import 'package:elagk/shared/global/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget OrderItem(context) => Container(
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
                child: Image.asset(
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
              Text('الطلب رقم 10210', style: TextStyle
                (
                fontSize: 18,
                fontWeight: FontWeight.bold

              )),
              Text('12-2-2021', style:
              TextStyle
                (
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                color: Colors.grey.shade500

              ))
            ],
          )
        ],
      ),
    );
