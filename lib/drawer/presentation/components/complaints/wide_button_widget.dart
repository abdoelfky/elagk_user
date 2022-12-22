import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

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
