import 'package:elagk/drawer/presentation/components/stepper_components/stepper_devider_component.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

import 'stepper_notes_component.dart';
import 'stepper_step_component.dart';

class StepperContent extends StatelessWidget {
  const StepperContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppPadding.p28),
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepperStep(
              stepperHeader: AppStrings.stepperHeader1,
              stepperBody: AppStrings.stepperBody1, stepperStatus: true,
            ),
            StepperDivider(stepperStatus: true,),
            StepperStep(
              stepperHeader: AppStrings.stepperHeader2,
              stepperBody: AppStrings.stepperBody2, stepperStatus: false,
            ),
            StepperDivider(stepperStatus: false,),
            StepperStep(
              stepperHeader: AppStrings.stepperHeader3,
              stepperBody: AppStrings.stepperBody3, stepperStatus: false,
            ),
            StepperDivider(stepperStatus: false),
            StepperStep(
              stepperHeader: AppStrings.stepperHeader4,
              stepperBody: AppStrings.stepperBody4, stepperStatus: false,
            ),
            SizedBox(
              height: mediaQueryHeight(context) * .05,
            ),
            StepperNotes()
          ],
        ),
      ),
    );
  }
}
