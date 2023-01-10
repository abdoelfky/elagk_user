import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/basket/presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/basket/presentation/basket_controller/basket_states.dart';
import 'package:elagk/shared/components/alert_dialoge.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_strings.dart';
import '../../../../shared/utils/app_values.dart';
import 'basket_products.dart';
import 'basket_salary.dart';

class BasketSection extends StatelessWidget {
  const BasketSection({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit, BasketStates>(
      listener: (context, state) {
        if (state is PostOrderSuccessState) {
          // showToast(
          //     text: 'Order Sent Successfully', state: ToastStates.SUCCESS);

          showDialog(
              context: context,
              builder: (_) {
                return alertDialog(
                  imageSrc: JsonAssets.orderDone,
                  text:
                  AppStrings.stepperBody1,
                );
              });

        } else if (state is PostOrderErrorState) {
          showToast(text: '${state.error}', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              BasketProducts(
                firstCategoryName: firstCategoryName,
              ),
              BasketSalary(
                totalPrice: BasketCubit.get(context).totalPrice,
              ),
              SizedBox(
                  width: double.infinity,
                  height: AppSize.s60,
                  child: ConditionalBuilder(
                      condition: state is PostOrderLoadingState||
                          state is PostCartLoadingState||
                          state is PutCartOrderLoadingState||
                          state is GetCartIdLoadingState||
                      state is PostCartOrderLoadingState,
                      builder: (BuildContext context) => Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                      fallback: (BuildContext context) => MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppPadding.p15),
                            ),
                            onPressed: () => {
                              if(BasketCubit.get(context).basketProducts.isNotEmpty){
                              BasketCubit.get(context).postCart(
                                  pharmacyId:BasketCubit.get(context).pharmacyId,
                                  distance: BasketCubit.get(context).distance
                              )
                            }
                              },
                            color: AppColors.offBlue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.buy,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ],
                            ),
                          ))),
            ],
          ),
        );
      },
    );
  }
}
