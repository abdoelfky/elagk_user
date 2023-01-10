import 'package:elagk/drawer/presentation/components/stepper_components/stepper_devider_component.dart';
import 'package:elagk/drawer/presentation/controller/stepper_controller/stepper_cubit.dart';
import 'package:elagk/drawer/presentation/controller/stepper_controller/stepper_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
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
    return BlocBuilder<StepperCubit, StepperState>(
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
                    ),
                    SizedBox(
                      height: mediaQueryHeight(context) * .05,
                    ),
                    StepperNotes()
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
