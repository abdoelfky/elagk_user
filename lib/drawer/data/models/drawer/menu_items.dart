import 'package:elagk/drawer/data/models/drawer/menu_item.dart';
import 'package:elagk/drawer/presentation/components/user_drawer_header.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuItems {
  static const homepage = MyMenuItem(AppStrings.homeScreen, ImageAssets.home);
  static const profile = MyMenuItem(AppStrings.profile, ImageAssets.user);
  static const complaints = MyMenuItem(AppStrings.complaints, ImageAssets.complaints);
  static const contactUs = MyMenuItem(AppStrings.contactUs, ImageAssets.contactUs);
  static const aboutUs = MyMenuItem(AppStrings.aboutUs, ImageAssets.aboutUs);
  static const orders = MyMenuItem(AppStrings.orders, ImageAssets.orders);
  static const points = MyMenuItem(AppStrings.points, ImageAssets.points);
  static const logOut = MyMenuItem(AppStrings.logOut, ImageAssets.logout);
  static const elagkStore = MyMenuItem(AppStrings.elagkStore, ImageAssets.elagkStore);
  static const specialCustomers = MyMenuItem(AppStrings.specialCustomers, ImageAssets.specialCustomers);

  static const all = <MyMenuItem>[
    homepage,
    elagkStore,
    profile,
    points,
    orders,
    specialCustomers,
    complaints,
    contactUs,
    aboutUs,


  ];

  static const logOutItem = <MyMenuItem>[
    logOut

  ];

}



class MenuScreen extends StatelessWidget {
  const MenuScreen({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  final MyMenuItem currentItem;
  final ValueChanged<MyMenuItem> onSelectedItem;

  Widget buildMenuItem(MyMenuItem item) => ListTileTheme(
    selectedColor: Colors.grey[200],
    child: ListTile(
      selectedColor: Colors.white,
      selected: currentItem == item,
      minLeadingWidth: AppSize.s20,
      leading: SvgPicture.asset(
        item.iconPath,
        height: AppSize.s25,
        width: AppSize.s25,
        fit: BoxFit.contain,
      ),
      title: Text(
        item.title,
        style: const TextStyle(fontSize: FontSize.s20),
      ),
      onTap: () => onSelectedItem(item),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.primary,
          body: SingleChildScrollView(
            child: Column(
              children: [
                // Flexible(
                //   child: BlocBuilder<PharmacyProfileBloc, PharmacyProfileState>(
                //     builder: (context, state) {
                //       switch (state.pharmacyUserRequestState) {
                //         case RequestState.loading:
                //           return const HeaderDrawerSection(
                //             title: AppConstants.empty,
                //             imageSrc: AppConstants.empty,
                //           );
                //         case RequestState.loaded:
                //           return HeaderDrawerSection(
                //             title: state.pharmacyUser!.pharmacyName ?? "User Name",
                //             imageSrc: state.pharmacyUser!.imageUrl!,
                //           );
                //         case RequestState.error:
                //           return const HeaderDrawerSection(
                //             title: AppStrings.undefined,
                //             imageSrc: AppStrings.undefined,
                //           );
                //       }
                //     },
                //   ),
                // ),
                UserDrawerHeader(context),
                SizedBox(height: mediaQueryWidth(context) / AppSize.s15),
                ...MenuItems.all.map(buildMenuItem).toList(),
                SizedBox(height: mediaQueryWidth(context) / AppSize.s6),
                ...MenuItems.logOutItem.map(buildMenuItem).toList(),

                // const Spacer(flex: AppSize.si2),
                // const LogOutSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
