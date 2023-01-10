import 'package:elagk/drawer/presentation/components/fixed_appbar_widget.dart';
import 'package:elagk/drawer/presentation/components/points_components/points_widget.dart';
import 'package:elagk/drawer/presentation/controller/points_controller/points_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/components/screen_background.dart';

import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_routes.dart';
import '../../../shared/utils/app_strings.dart';
import '../../../shared/utils/app_values.dart';
import '../../../shared/utils/navigation.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<PointsCubit , PointsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ScreenBackground(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar:fixedAppBar(
            context: context,
            title: AppStrings.points,
            actionWidget:const AppBarBasketIcon(),
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
          ),

          backgroundColor: AppColors.offWhite,
          body: RefreshIndicator(
            onRefresh: () async
            {
              PointsCubit.get(context).getUserPoints();
              PointsCubit.get(context).getProducts();
            },
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: AppSize.s120,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        // Pharmacy photo
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s15,
                                ),
                                gradient:const LinearGradient(
                                    begin:Alignment.topRight ,
                                    end:Alignment.bottomRight ,
                                    colors:
                                    [

                                      Color(0xff059053),
                                      Color(0xff12486e),
                                    ])
                            ),
                            width: mediaQueryWidth(context),
                            height: AppSize.s170,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: AppSize.s20,
                                ),
                                Center(
                                  child: Text(
                                    AppStrings.numOfPoints,
                                    style: TextStyle(
                                        fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),SizedBox(
                                  height: AppSize.s10,
                                ),
                                Center(
                                  child: Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Text(

                                      '${PointsCubit.get(context).userPoints.toString()} نقطه',
                                      style: TextStyle(
                                          fontSize: 19,color: Colors.white,fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),


                          ),
                        ),

                        // Pharmacy information

                      ],
                    ),
                  ),
                  SizedBox(
                      height: mediaQueryHeight(context) / AppSize.s40),
                  const PointsSection(
                    firstCategoryName: "categoryName",
                  ),
                ],

              ),


            ),
          ),
        ),
      ),
    );
  },
);
  }
}
