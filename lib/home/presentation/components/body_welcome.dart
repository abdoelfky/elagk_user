import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  const WelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(AppStrings.welcome,
        style: TextStyle(fontWeight: FontWeight.bold,fontSize:18),
      ),
      SizedBox(width: 2,),
      Icon(Icons.local_fire_department,color: AppColors.red,size: 25,)
    ],
  );
}
