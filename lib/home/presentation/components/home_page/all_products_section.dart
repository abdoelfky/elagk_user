import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/home/presentation/components/appbar_notification_icon.dart';
import 'package:elagk/home/presentation/components/home_page/home_page_appbar_widget.dart';
import 'package:elagk/home/presentation/components/home_page/order_item_widget.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

class AllOrdersSection extends StatelessWidget {
  const AllOrdersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future(() => print("Test")); // TODO.
      },
      // onRefresh: () => cubit.getAboutUs(),
      child: Scaffold(
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
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  itemCount: 3, // TODO.
                  // itemCount: cubit.pharmacyOrdersModel!.data!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return OrderItem(
                      orderNumber: "Test",
                      // TODO.
                      // cubit.pharmacyOrdersModel!.data![index].id.toString(),
                      orderDate: "Test",
                      // TODO.
                      // cubit.pharmacyOrdersModel!.data![index].date.toString(),
                      onTap: // TODO.
                          () {
                        /*cubit.getCategories();
                        cubit.getOneOrder(cubit
                            .pharmacyOrdersModel!.data![index].id
                            .toString());*/
                        navigateTo(
                            context: context,
                            screenRoute: Routes.oneOrderDetailsScreen);
                      },
                      status: 1,
                      // TODO.
                      // cubit.pharmacyOrdersModel!.data![index].status!.toInt(),

                      statusType: "Test", // TODO.
                      /*cubit.pharmacyOrdersModel!.data![index].status == 2
                          ? AppStrings.readyToDeliver
                          : cubit.pharmacyOrdersModel!.data![index].status == 3
                              ? AppStrings.deliverDone
                              : cubit.pharmacyOrdersModel!.data![index]
                                          .status ==
                                      5
                                  ? AppStrings.deliveringInProgress
                                  : AppStrings.undefined,*/
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
