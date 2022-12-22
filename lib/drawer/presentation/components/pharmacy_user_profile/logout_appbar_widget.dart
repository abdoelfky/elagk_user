import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/drawer_widgets/menu_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget logOutAppBar(
  BuildContext context, {
  required String title,
  required Widget widget,
}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p5),
          child: InkWell(
            onTap: () {
              var btn = MaterialButton(
                child: const Text(AppStrings.logOut),
                onPressed: () {
                  if (kDebugMode) {
                    print("Logout start");
                  }
                  // cubit.logOutAccount(context); // TODO.
                  if (kDebugMode) {
                    print("logout finish");
                  }
                  Navigator.of(context).pop(false);
                },
              );
              var cancelButton = MaterialButton(
                child: const Text(AppStrings.cancel),
                onPressed: () => Navigator.of(context).pop(false),
              );
              showDialog(
                context: context,
                builder: (BuildContext context) => Center(
                  child: Dialog(
                    insetPadding: EdgeInsets.symmetric(
                      horizontal: mediaQueryWidth(context) * AppSize.s0_2,
                      vertical: mediaQueryHeight(context) * AppSize.s0_3,
                    ),
                    clipBehavior: Clip.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s6),
                    ),
                    elevation: AppSize.s0,
                    backgroundColor: Colors.transparent,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(AppPadding.p6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(AppSize.s6),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: AppSize.s10,
                                offset: Offset(AppSize.s0, AppSize.s10),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const SizedBox(height: 5.0),
                                const Text(AppStrings.areYouSureLogOut),
                                // cubit.isLoadingAuth ? const Center(child: CircularProgressIndicator(color: AppColors.primary),):
                                Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[btn, cancelButton]),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.offWhite, width: AppSize.s1),
                    borderRadius: BorderRadius.circular(AppSize.s15)),
                child: widget),
          ),
        ),
      ],
      leading: const MenuWidget(), // TODO.
    );
