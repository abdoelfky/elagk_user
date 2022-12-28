import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/complaints_components/wide_button_widget.dart';
import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/controller/complaints_controller/complaints_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElagkStoreScreen extends StatelessWidget {
  const ElagkStoreScreen({Key? key}) : super(key: key);
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
            title: AppStrings.elagkStore,
            actionWidget:const AppBarBasketIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
          ),
          body: ScreenBackground(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
