import 'package:flutter/material.dart';

import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_values.dart';

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(AppSize.s0_8),
    transitionDuration: const Duration(milliseconds: DurationConstant.d300),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: AppMargin.m20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(AppSize.s40),
          ),
          child: const CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }
      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
