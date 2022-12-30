import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
final String currentLocation;
AppBarTitle({Key? key, required this.currentLocation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Text(currentLocation,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ],
    );
  }
}
