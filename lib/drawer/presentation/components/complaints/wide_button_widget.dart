
import 'package:flutter/material.dart';

import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_values.dart';

class WideButton extends StatelessWidget {
  WideButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
  }) : super(key: key);
  final void Function()? onPressed;
  Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s60,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        onPressed: onPressed,
        color: color ?? AppColors.offBlue,
        child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
