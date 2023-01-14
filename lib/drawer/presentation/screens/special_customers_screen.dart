
import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/components/special_customers_components/special_customers_content.dart';
import 'package:elagk/drawer/presentation/controller/special_customers_controller/special_cutomers_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

class SpecialCustomersScreen extends StatelessWidget {
  const SpecialCustomersScreen({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: fixedAppBar(
            context: context,
            title: AppStrings.specialCustomers,
            actionWidget:const AppBarBasketIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
          ),
          body: SpecialCustomersContent(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.refresh),
            onPressed: (){
              SpecialCustomersCubit.get(context).getSpecialCustomers();
            },
          ),
        ),
      ),
    );
  }
}
