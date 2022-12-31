

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/utils/app_assets.dart';
import '../../shared/utils/app_values.dart';
import '../controllers/onboarding_cubit.dart';
import '../controllers/onboarding_model.dart';
import 'onboarding_appBar.dart';

Widget buildBoardingItem(BoardingModel model,context) {

  return Stack(
    children: [

      Container(
        color: model.color,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}',),

            ),
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),

    ],
  );
}