import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
    required this.categoryName,
    required this.containerColor,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);

  final String categoryName;
  final Color containerColor;
  final BoxBorder? borderColor;
  final Color textColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: AppSize.s120,
          height: AppSize.s35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: borderColor,
            borderRadius: BorderRadius.circular(AppSize.s25),
            color: containerColor,
          ),
          child: Center(
            child: Text(
              categoryName,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: textColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
