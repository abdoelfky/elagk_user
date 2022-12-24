import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elagk/home/data/models/offers_model.dart';
import 'package:elagk/home/presentation/components/carosel_item.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';


class OffersWidget extends StatefulWidget {
  @override
  State<OffersWidget> createState() => _OffersWidgetState();
}

class _OffersWidgetState extends State<OffersWidget> {

  List<OffersModel> offers = [
    OffersModel(
        offerPercent: '30%',
        pharmacyName: 'الندى')
  ];




  @override
  Widget build(BuildContext context) =>CarouselSlider.builder
    (
    itemCount: 4,
      itemBuilder: (context,index,realIdx)=>carouselItem(context),
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


