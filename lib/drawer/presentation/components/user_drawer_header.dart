import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget UserDrawerHeader(context) => Padding(
      padding: const EdgeInsets.all(AppPadding.p15),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                )),
            child: Center(
              child: Image(
                image: AssetImage(
                  'assets/images/menu/profile.png',
                ),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            CacheHelper.getData(key: AppConstants.userName),
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
