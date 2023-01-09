import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elagk/home/data/models/pharmacy_offer_model.dart';
import 'package:elagk/home/presentation/components/carosel_item.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';


class OffersWidget extends StatefulWidget {
  const OffersWidget({super.key, required this.offers});

  @override
  State<OffersWidget> createState() => _OffersWidgetState(offers);
  final List<PharmacyOfferModel> offers;

}

class _OffersWidgetState extends State<OffersWidget> {
  final List<PharmacyOfferModel> offers;

  _OffersWidgetState(this.offers);


  @override
  Widget build(BuildContext context) =>CarouselSlider.builder
    (
    itemCount: offers.length,
      itemBuilder: (context,index,realIdx)=>carouselItem(context,offers[index]),
      options:  CarouselOptions(
        autoPlay: true,
        aspectRatio: 20 / 8,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayCurve: Curves.easeInOutSine,
        scrollPhysics: const BouncingScrollPhysics(),
      ),
  );
}


