import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class StepperDivider extends StatelessWidget {
  const StepperDivider({Key? key, required this.stepperStatus}) : super(key: key);
  final bool stepperStatus;

  @override
  Widget build(BuildContext context) {
    return       Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        height:AppSize.s35,
        width: 1,
        color: !stepperStatus?Colors.grey:AppColors.primary,
      ),
    );

  }
}
