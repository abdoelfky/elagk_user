import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class CloseDrawerButton extends StatelessWidget {
  const CloseDrawerButton({Key? key, required this.onPressed}) : super(key: key);
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
    horizontal: AppMargin.m20,
      vertical: AppMargin.m24,
    ),
      height: AppSize.s48,
      width: AppSize.s48,
      decoration: BoxDecoration(
        color: AppColors.shadow,
        borderRadius: BorderRadius.circular(AppSize.s48),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.close,
          color: Colors.white,
          size: AppSize.s24,
        ),
      ),
    );
  }
}
