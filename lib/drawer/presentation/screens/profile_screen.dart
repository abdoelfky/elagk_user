import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/components/profile_components/profile_content.dart';
import 'package:elagk/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            // TODO: remove Scaffold qnd appBar.
            appBar: fixedAppBar(
              context: context,
              title: AppStrings.profile,
              actionWidget: const AppBarBasketIcon(),
              onTap: () {
                navigateTo(
                  context: context,
                  screenRoute: Routes.basketScreen,
                );
              },
            ),
            body: BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state)
                {

                }
                , builder: (context, state)
            {
              if(state is ProfileGetUserDataLoadingState) {
                return Center(child: CircularProgressIndicator(color: AppColors.primary,),);
              }

              else{
                return  ProfileContent();
              }
                          })),
        // HomeScreen
      ),
    );
  }
}
