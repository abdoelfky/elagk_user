import 'package:elagk/home/presentation/components/appbar_notification_icon.dart';
import 'package:elagk/home/presentation/components/home_page/home_page_appbar_widget.dart';
import 'package:elagk/home/presentation/components/home_page/no_orders_available_widget.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

class AllOrders extends StatelessWidget {
  const AllOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // TODO: remove Scaffold qnd appBar.
          appBar: homePageAppBar(
            title: AppStrings.orders,
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.notificationsScreen,
              );
            },
            actionWidget: const AppBarNotificationIcon(),
            context,
          ),
          body: const NoOrdersAvailable(),
        ),
        // cubit.pharmacyOrdersModel != null ? const LoadingWidget() : // TODO.
        // AllOrdersSection(), // TODO: remove comments.
      ),
    );
  }
}
