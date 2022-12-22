import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoNotificationsAvailable extends StatelessWidget {
  const NoNotificationsAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(JsonAssets.noNotifications),
          Text(
            AppStrings.noNotificationsAvailable,
            maxLines: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          )
        ],
      ),
    );
  }
}
