import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoOrdersAvailable extends StatelessWidget {
  const NoOrdersAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(JsonAssets.ordersDone),
          Text(
            AppStrings.noOrdersAvailable,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
