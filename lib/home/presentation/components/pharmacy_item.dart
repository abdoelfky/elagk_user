import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';


  Widget  PharmacyItem(context)=>InkWell(
    onTap: () {
navigateTo(context: context, screenRoute:Routes.pharmacy);
    },
    child: Container(
      width: mediaQueryWidth(context) * .4,
      height: mediaQueryHeight(context) * .09,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(
              'assets/images/profile/download (4).png',
            ),
            width: mediaQueryWidth(context) * .35,
            height: mediaQueryHeight(context) * .12,
          ),
          SizedBox(
            height: 10,
            width: 10,
          ),
          Column(
            children: [
              Text(
                'صيدليه 19011 فرع مدينه نصر',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                [
                  const Icon(Icons.location_on_outlined,color: Colors.green,size: 18,),
                  const SizedBox(width: 5,),
                  Text('الاسكندريه-الشاطئ النيل',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),

            ],
          ),
        ],
      ),
    ),
  );



