import 'package:elagk/drawer/presentation/components/back_appbar_widget.dart';
import 'package:elagk/home/presentation/components/appbar_notification_icon.dart';
import 'package:elagk/home/presentation/components/one_order_details/customer_info_section.dart';
import 'package:elagk/home/presentation/components/one_order_details/editing_price_details.dart';
import 'package:elagk/home/presentation/components/one_order_details/medicines_section.dart';
import 'package:elagk/home/presentation/components/one_order_details/only_one_order_type.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

import 'price_summary.dart';

class OneOrderDetailsBody extends StatelessWidget {
  const OneOrderDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBarWithBack(
        context,
        title: "Test", // TODO.
        // "${AppStrings.orderNum}${cubit.oneOrderModel!.data!.id.toString()}",
        actionsButton: () => navigateTo(
          context: context,
          screenRoute: Routes.notificationsScreen,
        ),
        actionsWidget: const AppBarNotificationIcon(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          children: [
            // customer info
            const CustomerInfo(),
            // map
            InkWell(
              onTap: (){}, // TODO.
                /*  () => cubit.launchMap(
                lat: cubit.oneOrderModel!.data!.latitude.toString(),
                lng: cubit.oneOrderModel!.data!.longitude.toString(),),*/
              child: Image.asset(ImageAssets.mapBackground),
            ),
            if (true) // TODO: remove this line condition.
            // if (cubit.oneOrderModel!.data!.type!.toInt() == 1)
              const OnlyOneOrderType(),
            const SizedBox(height: 20),
            if (true) // TODO: remove this line condition.
            // if (cubit.oneOrderModel!.data!.type!.toInt() == 0)
              // medicines
              const MedicinesSection(),
            const PriceSummary(
              totalPrice: "Test", // TODO.
              // cubit.oneOrderModel!.data!.price.toString(),
              couponAmount: "Test", // TODO.
              // cubit.oneOrderModel!.data!.couponAmount.toString(),
              priceAfterOffer: "Test", // TODO.
              // cubit.oneOrderModel!.data!.priceAfterOffer.toString(),
            ),
            const SizedBox(height: 25), // TODO.
            if (true) // TODO: remove this line condition.
            // if (cubit.oneOrderModel!.data!.status == 1)
              // editing Price details
              const EditingPriceDetails(),
          ],
        ),
      ),
    );
  }
}
