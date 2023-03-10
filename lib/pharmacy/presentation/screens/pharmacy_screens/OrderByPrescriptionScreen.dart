import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk/auth/presentation/components/main_button.dart';
import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/components/past_orders_components/orders_conents.dart';
import 'package:elagk/drawer/presentation/components/profile_components/profile_content.dart';
import 'package:elagk/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/home/presentation/components/body_welcome.dart';
import 'package:elagk/home/presentation/components/offers_slider_widget.dart';
import 'package:elagk/home/presentation/components/pharmacies_widget.dart';
import 'package:elagk/home/presentation/components/search_widget.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/presentation/components/OrderByPrescriptionComponents/OrderByPrescriptionContent.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:elagk/shared/utils/text_field_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderByPrescriptionScreen extends StatelessWidget {
  final PharmacyModel? pharmacyModel;

  const OrderByPrescriptionScreen({Key? key, this.pharmacyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            appBar: SecondAppBar(
              context: context,
              title: AppStrings.prescriptionHeader,
              actionWidget: const AppBarBasketIcon(),
              onTap: () {
                navigateTo(
                  context: context,
                  screenRoute: Routes.basketScreen,
                );
              },
            ),
            body: BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return OrderByPrescriptionContent(pharmacyModel:pharmacyModel,);
                })),
        // HomeScreen
      ),
    );
  }
}
