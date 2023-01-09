import 'dart:ui';

import 'package:elagk/home/data/models/pharmacy_offer_model.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

Widget carouselItem(context,PharmacyOfferModel offer) => InkWell(
      onTap: ()
      {

        HomeScreenCubit.get(context).getOfferProducts(pharmacyId: offer.pharmacyId!);
        navigateTo(context: context,
            screenRoute: Routes.offersScreen);
      },
      child: Container(
        width: mediaQueryHeight(context) * .26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            Container(
              height: mediaQueryWidth(context) * .4,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.asset('assets/images/order/pharmacy.png',
                      fit: BoxFit.cover)),
            ),
            ClipRRect(
              // Clip it cleanly.

              child: BackdropFilter(

                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(offer.longitude!.round()*10
                        +offer.latitude!.round()).withOpacity(0.38),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'خصم 30 %',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    'خاص على صيدليه الندى',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Text(
                    '${offer.pharmacyName}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );


