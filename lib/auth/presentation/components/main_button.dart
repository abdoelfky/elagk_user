import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: AppSize.s60,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppPadding.p15),
          ),
          onPressed: () => onPressed(),
          color: color ?? AppColors.blue,
          child: Text(title, style: Theme.of(context).textTheme.headlineMedium),
        ));
  }
}
