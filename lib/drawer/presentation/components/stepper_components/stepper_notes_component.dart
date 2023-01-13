import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class StepperNotes extends StatelessWidget {
  StepperNotes({Key? key, required this.name, required this.phones}) : super(key: key);
  final String name;
  final List<String> phones;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppStrings.deliveryName,
                style: Theme.of(context).textTheme.displayMedium
            ),
            Text(name,
                style: Theme.of(context).textTheme.displayMedium
            ),
          ],
        ),
        SizedBox(height: 10,),
        Row(
          children: [
            Text(AppStrings.deliveryPhone,
                style: Theme.of(context).textTheme.displayMedium
            ),
            Text(phones.first,
                style: Theme.of(context).textTheme.displayMedium
            ),
          ],
        ),
      ],
    );
  }
}
