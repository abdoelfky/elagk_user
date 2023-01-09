import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/components/past_orders_components/orders_conents.dart';
import 'package:elagk/drawer/presentation/controller/past_orders_controller/past_orders_cubit.dart';
import 'package:elagk/drawer/presentation/controller/past_orders_controller/past_orders_state.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            appBar: fixedAppBar(
              context: context,
              title: AppStrings.pastOrders,
              actionWidget: const AppBarBasketIcon(),
              onTap: () {
                navigateTo(
                  context: context,
                  screenRoute: Routes.basketScreen,
                );
              },
            ),
            body: ScreenBackground(child: OrdersContents())

    )
      )
    );
  }
}
