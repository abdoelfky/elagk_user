import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
      [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            const Icon(Icons.location_on_outlined,color: Colors.green),
           const SizedBox(width: 5,),
           Text(AppStrings.address,
             style: Theme.of(context).textTheme.titleMedium,
           )
          ],
        ),
        Text('الاسكندريه-الشاطئ النيل',
          style: Theme.of(context).textTheme.displayLarge,
        )
      ],
    );
  }
}
