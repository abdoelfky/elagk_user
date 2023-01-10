import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class StepperStep extends StatelessWidget {
  StepperStep(
      {Key? key,
      required this.stepperHeader,
      required this.stepperBody,
      required this.stepperStatus,
      required this.isRejected})
      : super(key: key);

  final String stepperHeader;
  final String stepperBody;
  final bool stepperStatus;
  final bool isRejected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 16,
            backgroundColor: isRejected
                ? Colors.red
                : !stepperStatus
                    ? Colors.grey
                    : AppColors.primary,
            child: !isRejected
                ? Icon(
                    Icons.check,
                    color: Colors.white,
                  )
                : Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(stepperHeader,
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              height: 2,
            ),
            Text(stepperBody, style: Theme.of(context).textTheme.bodyMedium)
          ],
        )
      ],
    );
  }
}
