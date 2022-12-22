import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app__fonts.dart';
import '../../../../shared/utils/app_assets.dart';
import '../../../../shared/utils/app_constants.dart';
import '../../../../shared/utils/app_strings.dart';
import '../../../../shared/utils/app_values.dart';
import '../../../../shared/utils/enums.dart';
import '../../controller/pharmacy_user_profile_controller/pharmacy_profile_bloc.dart';
import 'drawer_header.dart';
import 'logout_widget.dart';
import 'menu_item.dart';

class MenuItems {
  static const homepage = MyMenuItem(AppStrings.homeScreen, ImageAssets.home);
  static const profile = MyMenuItem(AppStrings.profile, ImageAssets.user);
  static const complaints =
      MyMenuItem(AppStrings.complaints, ImageAssets.complaints);
  static const contactUs =
      MyMenuItem(AppStrings.contactUs, ImageAssets.contactUs);
  static const aboutUs = MyMenuItem(AppStrings.aboutUs, ImageAssets.aboutUs);

  static const all = <MyMenuItem>[
    homepage,
    profile,
    complaints,
    contactUs,
    aboutUs,
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
          body: Column(
            children: [
              Flexible(
                child: BlocBuilder<PharmacyProfileBloc, PharmacyProfileState>(
                  builder: (context, state) {
                    switch (state.pharmacyUserRequestState) {
                      case RequestState.loading:
                        return const HeaderDrawerSection(
                          title: AppConstants.empty,
                          imageSrc: AppConstants.empty,
                        );
                      case RequestState.loaded:
                        return HeaderDrawerSection(
                          title: state.pharmacyUser!.pharmacyName ?? "User Name",
                          imageSrc: state.pharmacyUser!.imageUrl!,
                        );
                      case RequestState.error:
                        return const HeaderDrawerSection(
                          title: AppStrings.undefined,
                          imageSrc: AppStrings.undefined,
                        );
                    }return const HeaderDrawerSection(
                      title: AppStrings.undefined,
                      imageSrc: AppStrings.undefined,
                    );
                  },
                ),
              ),
              SizedBox(height: mediaQueryWidth(context) / AppSize.s10),
              ...MenuItems.all.map(buildMenuItem).toList(),
              const Spacer(flex: AppSize.si2),
              const LogOutSection(),
            ],
          ),
        ),
      ),
    );
  }
}
