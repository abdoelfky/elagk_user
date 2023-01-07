import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/components/MainTextFormField.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/orderByPerscripiyion_controller/order_by_perscripiyion_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/orderByPerscripiyion_controller/order_by_perscripiyion_state.dart';
import 'package:elagk/shared/components/toast_component.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'AddPrescriptionImage.dart';
import 'OrderByPrescriptionDevider.dart';

class OrderByPrescriptionContent extends StatelessWidget {
  final PharmacyModel? pharmacyModel;

  OrderByPrescriptionContent({Key? key, this.pharmacyModel}) : super(key: key);
  static final _orderController = TextEditingController();
  static final _discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderByPerscripiyionCubit, OrderByPerscripiyionStates>(
      listener: (context, state)
      {
        if (state is OrderByPerscripiyionSuccessState) {
          {
            showToast(
                text: AppStrings.prescriptionDone,
                state: ToastStates.SUCCESS);

          }

        } else if (state is OrderByPerscripiyionErrorState) {
          showToast(
              text: AppStrings.tryAgain ,
              state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //deliverTo
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.green,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppStrings.deliverTo,
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                ),
                Text(
                  AppConstants.currentLocation,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                //pharmacy name
                Row(
                  children: [
                    Image.asset(
                      'assets/images/drawer_icons/phamacy.png',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppStrings.pharmacyName,
                      style: Theme.of(context).textTheme.displayLarge,
                    )
                  ],
                ),
                Text(
                  pharmacyModel!.pharmacyName!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                //write your order
                Text(
                  AppStrings.writeYourOrder,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                MainTextFormField(
                  hintColor: Colors.white,
                  focusColor: Colors.white,
                  controller: _orderController,
                  obscure: false,
                  maxLines: 3,
                  validator: (value) {},
                  inputType: TextInputType.multiline,
                  label: AppStrings.orderDetails,
                ),
                const SizedBox(
                  height: 20,
                ),
                //OOOOOOOOORRRRRRRR
                OrderByPrescriptionDivider(context),

                SizedBox(
                  height: 20,
                ),
                AddPrescriptionImage(context),
                SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.addDiscountCode,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                MainTextFormField(
                  controller: _discountController,
                  label: AppStrings.discountCode,
                  hint: AppStrings.discountCodeExample,
                  hintColor: Colors.white,
                  focusColor: Colors.white,
                  inputType: TextInputType.visiblePassword,
                  textDirection: TextDirection.ltr,
                  obscure: false,
                  icon: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green[700]),
                      child: Center(
                          child: Text(
                        AppStrings.active,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  validator: (value) {
                    // if (value!.length < AppSize.s8) {
                    //   return AppStrings.enterValidPassword;
                    // } else {
                    //   return null;
                    // }
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                    width: double.infinity,
                    height: AppSize.s60,
                    child: ConditionalBuilder(
                        condition: state is !OrderByPerscripiyionLoadingState,
                        builder: (context) => MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppPadding.p15),
                              ),
                              onPressed: () => {
                                OrderByPerscripiyionCubit.get(context)
                                    .orderByPerscription(
                                        prescriptionImageFile:
                                            OrderByPerscripiyionCubit.get(
                                                    context)
                                                .imagePath,
                                        pharmacyId: pharmacyModel!.pharmacyId)
                              },
                              color: AppColors.offBlue,
                              child: Center(
                                child: Text(AppStrings.confirmOrder,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium),
                              ),
                            ),
                        fallback: (context) => Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ))),

                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
