import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/utils/app__fonts.dart';
import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogOutSection extends StatelessWidget {
  const LogOutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: AppSize.s20,
      leading: SvgPicture.asset(
        ImageAssets.logout,
        height: AppSize.s25,
        width: AppSize.s25,
        fit: BoxFit.contain,
      ),
      title: const Text(
        AppStrings.logOut,
        style: TextStyle(fontSize: FontSize.s20, color: Colors.white),
      ),
      onTap: () {
        CacheHelper.deleteData(key: AppConstants.token).then((value) {
          navigateFinalTo(
            context: context,
            screenRoute: Routes.loginPharmacyScreen,
          );
          CacheHelper.deleteData(key: AppConstants.pharmacyId);
          CacheHelper.deleteData(key: AppConstants.defaultCategory);
        });
      },
    );
  }
}
