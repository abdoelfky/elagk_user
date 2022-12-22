import 'package:elagk/notification/presentation/components/no_notifications_available_widget.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              AppStrings.notifications,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: AppSize.s0,
            automaticallyImplyLeading: true,
          ),
          body: const NoNotificationsAvailable(),
          /*SingleChildScrollView(
                child: ListView.builder(
                  itemCount: 5, // TODO.
                  // itemCount: cubit.pharmacyOrdersModel!.data!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return NotificationItem(
                      orderNumber: '45',
                      // TODO.
                      orderTime: '$index',
                      // TODO.
                      // cubit.pharmacyOrdersModel!.data![index].id.toString(),
                      // cubit.pharmacyOrdersModel!.data![index].date.toString(),
                      onTap: () {
                        // TODO.
                        */ /*cubit.getCategories();
                        cubit.getOneOrder(cubit
                            .pharmacyOrdersModel!.data![index].id
                            .toString());*/ /*
                        navigateTo(
                          context: context,
                          screenRoute: Routes.oneOrderDetailsScreen,
                        );
                      },
                    );
                  },
                ),
              ),*/
        ),
      ),
    );
  }
}
