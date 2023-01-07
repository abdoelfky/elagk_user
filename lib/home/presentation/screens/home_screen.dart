import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/drawer/presentation/components/home_drawe_widget.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/home/presentation/components/app_bar_title.dart';
import 'package:elagk/home/presentation/components/body_welcome.dart';
import 'package:elagk/home/presentation/components/home_app_bar.dart';
import 'package:elagk/home/presentation/components/offers_slider_widget.dart';
import 'package:elagk/home/presentation/components/pharmacies_widget.dart';
import 'package:elagk/home/presentation/components/search_widget.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_cubit.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/opening/presentation/screens/offline_widget.dart';
import 'package:elagk/shared/components/check_your_internet_widget.dart';
import 'package:elagk/shared/components/gps_permission_denied.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/components/na_data_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenCubit, HomeScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: Scaffold(
                // TODO: remove Scaffold qnd appBar.
                appBar: homePageAppBar(
                  title: AppBarTitle(
                      currentLocation: AppConstants.currentLocation),
                  onTap: () {
                    navigateTo(
                      context: context,
                      screenRoute: Routes.basketScreen,
                    );
                  },
                  actionWidget: const AppBarBasketIcon(),
                  context,
                ),
                body:
                state is GetPermissionErrorState ? GpsPermissionDenied() :

                    ScreenBackground(
                child: Padding(
                padding: const EdgeInsets.all(AppPadding.p15),
                child: RefreshIndicator(
                  onRefresh: () async
                  {
                    HomeScreenCubit.get(context).getUserProfileData();
                    HomeScreenCubit.get(context).getPermission();
                  },
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: mediaQueryHeight(context) * .025,
                        ),
                        WelcomeWidget(),
                        SizedBox(
                          height: mediaQueryHeight(context) * .025,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s8,
                                ),
                                gradient: const LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xff137e8f),
                                      Color(0xff059053),
                                    ])),
                            width: mediaQueryWidth(context),
                            height: AppSize.s230,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: AppSize.s30,
                                ),
                                const Center(
                                  child: Text(
                                    AppStrings.searchForPharmacy,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  ),
                                ),
                                SearchWidget(),
                              ],
                            ),
                          ),
                        ), // Pharmacy information
                        SizedBox(
                          height: mediaQueryHeight(context) * .025,
                        ),
                        OffersWidget(),
                        SizedBox(
                          height: mediaQueryHeight(context) * .025,
                        ),

                        state is GetPharmaciesLoadingState
                            ? Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                            : state is GetPharmaciesSuccessState &&
                            HomeScreenCubit
                                .get(context)
                                .pharmacies
                                .isEmpty
                            ? Center(child: NoDataWidget(AppStrings.noPharmacies))
                            : HomeScreenCubit
                            .get(context)
                            .pharmacies
                            .isNotEmpty
                            ? PharmaciesWidget()
                            :state is GetPharmaciesErrorState? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CheckYourInternetWidget(),
                        ):
                        Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
        // HomeScreen
        )
        ,
        );
      },
    );
  }
}
