import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
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
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              elevation: 24.0,
              title: Text('Are You Sure?',
                  style: TextStyle(color: Colors.black)),
              content: Text('You will log out',
                  style: TextStyle(color: Colors.black)),
              actions: [
                CupertinoDialogAction(
                  child: Container(
                    child: Text(
                      'Log out',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  onPressed: () {

                    CacheHelper.deleteData(key: AppConstants.token).then((value) {
                      CacheHelper.deleteData(key: AppConstants.userId);
                      navigateFinalTo(
                        context: context,
                        screenRoute: Routes.loginScreen,
                      );
                    });
                  },
                ),
                CupertinoDialogAction(
                  child: Text('Cancel',
                      style: TextStyle(color: AppColors.primary)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ));


      },
    );
  }
}
