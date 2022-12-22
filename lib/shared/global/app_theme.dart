import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.primary,
  fontFamily: FontConstants.dINNextLTArabicFontFamily,
  textTheme: const TextTheme(
    // For title bold texts
   titleMedium: TextStyle(
     fontSize: FontSize.s24,
     color: Colors.black,
     fontWeight: FontWeightManager.bold,
   ),
    // For subtitle lightGrey texts
   titleSmall: TextStyle(
     fontSize: FontSize.s18,
     color: AppColors.lightGrey,
   ),
   // For text buttons
   labelMedium: TextStyle(
     fontSize: FontSize.s14,
     fontWeight: FontWeightManager.semiBold
   ),
    // For small texts
    displaySmall: TextStyle(
      fontSize: FontSize.s12,
      fontWeight: FontWeightManager.semiBold,
    ),
    // For hint texts
    displayMedium: TextStyle(
      fontSize: FontSize.s18,
      fontWeight: FontWeightManager.semiBold,
  ),
    // For text form fields input
    displayLarge: TextStyle(
      fontSize: FontSize.s20,
      fontWeight: FontWeightManager.semiBold,
    ),
    // For description text.
    headlineSmall: TextStyle(
      fontSize: FontSize.s14,
      color: AppColors.boldGrey,
    ),
    // For buttons label
    headlineMedium: TextStyle(
      fontSize: FontSize.s16,
      fontWeight: FontWeightManager.semiBold,
      color: Colors.white,
    ),
    // For appbar title
    headlineLarge: TextStyle(
      fontSize: FontSize.s22,
      fontWeight: FontWeightManager.medium,
    ),

  ),
  // scrolling color.
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: AppColors.primary,
  ),
);
