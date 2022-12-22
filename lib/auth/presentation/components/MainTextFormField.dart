import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class MainTextFormField extends StatelessWidget {
  MainTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    required this.obscure,
    required this.validator,
    required this.inputType,
    this.hint,
    this.maxLines,
    this.focusColor,
    this.hintColor,
    this.icon,
    this.suffixIcon,
    this.textDirection,
  }) : super(key: key);
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;
  final TextInputType inputType;
  String? hint;
  bool obscure = false;
  Color? focusColor;
  Color? hintColor;
  Widget? icon;
  Widget? suffixIcon;
  TextDirection? textDirection;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      validator: validator,
      controller: controller,
      keyboardType: inputType,
      obscureText: obscure,
      maxLines: maxLines ?? AppSize.si1,
      textDirection: textDirection ?? TextDirection.rtl,
      textAlignVertical: TextAlignVertical.center,
      // cursorHeight: AppSize.s30,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            height: AppSize.s1_9,
          ),
      decoration: InputDecoration(
        alignLabelWithHint: true,
        isCollapsed: true,
        filled: true,
        fillColor: focusColor,
        focusColor: focusColor,
        suffix: suffixIcon,
        hintText: hint ?? '',
        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: hintColor,
            ),
        label: Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.lightGrey,
              ),
        ),
        contentPadding: const EdgeInsets.only(
          right: AppPadding.p20,
          left: AppPadding.p20,
          bottom: AppPadding.p10,
        ),
        suffixIcon: icon,
        focusedBorder: _outlineInputBorder(),
        enabledBorder: _outlineInputBorderStyle(),
        errorBorder: _outlineInputBorderErrorStyle(),
      ),
    );
  }
}

OutlineInputBorder _outlineInputBorder() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.blue,
      width: AppSize.s0_5,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s15),
    ),
  );
}

OutlineInputBorder _outlineInputBorderStyle() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: AppSize.s0_5,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s15),
    ),
  );
}

OutlineInputBorder _outlineInputBorderErrorStyle() {
  return const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: AppSize.s0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(AppSize.s15),
    ),
  );
}
