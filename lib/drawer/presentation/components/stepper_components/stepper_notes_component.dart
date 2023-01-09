import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class StepperNotes extends StatelessWidget {
  const StepperNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Text(AppStrings.deliveryName,
            style: Theme.of(context).textTheme.displayMedium
        ),
        SizedBox(height: 10,),
        Text(AppStrings.deliveryPhone,
            style: Theme.of(context).textTheme.displayMedium
        ),
      ],
    );
  }
}
