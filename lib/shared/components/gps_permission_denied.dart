import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';

class GpsPermissionDenied extends StatelessWidget {
  const GpsPermissionDenied({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
  builder: (context, state) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(JsonAssets.permissionDenied),
              Padding(
                padding:EdgeInsets.all(AppPadding.p20),
                child: Text(
                  AppStrings.pleaseGiveGPSPermission,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: mediaQueryHeight(context) / AppSize.s80),
              Text(
                AppStrings.thenRestartApp,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge,
              )
            ],
          ),
        ),
      ),

    );
  },
);
  }
}
