import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoPharmaciesAvailable extends StatelessWidget {
  const NoPharmaciesAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(JsonAssets.noPharmacies),
          SizedBox(height: 50,),
          Text(
            AppStrings.noPharmacies,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
