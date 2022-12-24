import 'package:elagk/drawer/data/models/drawer/menu_item.dart';
import 'package:elagk/drawer/data/models/drawer/menu_items.dart';
import 'package:elagk/drawer/presentation/screens/about_us_screen.dart';
import 'package:elagk/drawer/presentation/screens/complaints_screen.dart';
import 'package:elagk/drawer/presentation/screens/contact_us_screen.dart';
import 'package:elagk/drawer/presentation/screens/elagk_store_screen.dart';
import 'package:elagk/drawer/presentation/screens/orders_screen.dart';
import 'package:elagk/drawer/presentation/screens/points_screen.dart';
import 'package:elagk/drawer/presentation/screens/special_customers_screen.dart';
import 'package:elagk/home/presentation/screens/home_screen.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  MyMenuItem currentItem = MenuItems.homepage;

  getScreen(MyMenuItem currentItem) {
    switch (currentItem) {
      case MenuItems.homepage:
        return const HomeScreen();
      case MenuItems.points:
        return const PointsScreen();
      case MenuItems.elagkStore:
        return const ElagkStoreScreen();
      case MenuItems.specialCustomers:
        return const SpecialCustomersScreen();
      case MenuItems.orders:
        return const OrdersScreen();
      case MenuItems.contactUs:
        return const ContactUsScreen();
      case MenuItems.complaints:
        return const ComplaintsScreen();
      case MenuItems.aboutUs:
        return const AboutUsScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuBackgroundColor: AppColors.primary,
      isRtl: true,
      menuScreen: Builder(
        builder: (context) => Stack(
          children: [
            MenuScreen(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context)!.close();
              },
            ),
          ],
        ),
      ),
      mainScreenTapClose: true,
      mainScreen: getScreen(currentItem),
      style: DrawerStyle.defaultStyle,
      borderRadius: AppSize.s100,
      angle: AppSize.s0,
      slideWidth: mediaQueryWidth(context) * AppSize.s0_7,
    );
  }
}
