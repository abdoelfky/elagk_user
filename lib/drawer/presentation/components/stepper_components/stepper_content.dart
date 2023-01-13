import 'package:elagk/drawer/presentation/components/stepper_components/stepper_devider_component.dart';
import 'package:elagk/drawer/presentation/controller/stepper_controller/stepper_cubit.dart';
import 'package:elagk/drawer/presentation/controller/stepper_controller/stepper_state.dart';
import 'package:elagk/shared/components/alert_dialoge.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stepper_notes_component.dart';
import 'stepper_step_component.dart';

class StepperContent extends StatelessWidget {
  const StepperContent({Key? key, required this.orderId}) : super(key: key);

  final int orderId;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StepperCubit, StepperState>(
      listener: (context,state)
      {

        if(    StepperCubit.get(context)
            .stepperFollowModel!
            .isRejected ==true)


          showDialog(
              context: context,
              builder: (_) {
                return alertDialog(
                  imageSrc: JsonAssets.notAvailable,
                  text:
                  'نأسف لك هذا المنتج غير متوفر حاليا برجاء المحاوله في صيدليه اخرى',
                );
              });
      },
      builder: (context, state) {
        // StepperCubit.get(context).followOrder(orderId: orderId);


        if (state is OrderFollowSuccessState)
          return Padding(
            padding: EdgeInsets.all(AppPadding.p28),
            child: RefreshIndicator(
              onRefresh: () async {
                StepperCubit.get(context).followOrder(orderId: orderId);
              },
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [


                    StepperStep(
                      stepperHeader: AppStrings.stepperHeader1,
                      stepperBody: AppStrings.stepperBody1,
                      stepperStatus: true,
                      isRejected: false,

                    ),
                    StepperDivider(
                      stepperStatus: true,
                    ),
                    StepperStep(
                      stepperHeader: AppStrings.stepperHeader2,
                      stepperBody: AppStrings.stepperBody2,
                      stepperStatus: StepperCubit.get(context)
                          .stepperFollowModel!
                          .isAcceptedByPharmacy!,
                        isRejected:  StepperCubit.get(context)
                            .stepperFollowModel!
                            .isRejected!,
                    ),
                    StepperDivider(
                      stepperStatus: StepperCubit.get(context)
                          .stepperFollowModel!
                          .isAcceptedByPharmacy!,
                    ),
                    StepperStep(
                      stepperHeader: AppStrings.stepperHeader3,
                      stepperBody: AppStrings.stepperBody3,
                      stepperStatus: StepperCubit.get(context)
                          .stepperFollowModel!
                          .isAcceptedByDelivery!,
                      isRejected: StepperCubit.get(context)
                          .stepperFollowModel!
                          .isRejected!,
                    ),
                    StepperDivider(
                        stepperStatus: StepperCubit.get(context)
                            .stepperFollowModel!
                            .isAcceptedByDelivery!),
                    StepperStep(
                      stepperHeader: AppStrings.stepperHeader4,
                      stepperBody: AppStrings.stepperBody4,
                      stepperStatus: StepperCubit.get(context)
                          .stepperFollowModel!
                          .isDelivered!,
                      isRejected: StepperCubit.get(context)
                          .stepperFollowModel!
                          .isRejected!,
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) * .05,
                    ),
                    StepperNotes(
                      name:
                      StepperCubit.get(context)
                          .stepperFollowModel?.deliveryDetails !=null?
                      StepperCubit.get(context)
                          .stepperFollowModel!.deliveryDetails!.firstName.toString()+
                      ' '+
                          StepperCubit.get(context)
                              .stepperFollowModel!.deliveryDetails!.lastName.toString():
                      'لم يتم تحديد السائق بعد',
                      phones:
                      StepperCubit.get(context)
                          .stepperFollowModel?.deliveryDetails !=null ?
                      StepperCubit.get(context)
                          .stepperFollowModel!.deliveryDetails!.phones!.toList() :[''],
                    )
                  ],
                ),
              ),
            ),
          );
        else
          return Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
      },
    );
  }
}
