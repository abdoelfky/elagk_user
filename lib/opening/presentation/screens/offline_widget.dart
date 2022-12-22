import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(JsonAssets.noInternet),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s35),
            Text(
              AppStrings.noInternetConnection,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s80),
            Text(
              AppStrings.failedToConnect,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            )
          ],
        ),
      ),
    );
  }
}
