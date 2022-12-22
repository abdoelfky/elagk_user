import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class ShowPickerDialog extends StatelessWidget {
  const ShowPickerDialog({
    Key? key,
    required this.onCameraTapped,
    required this.onGalleryTapped,
  }) : super(key: key);
  final VoidCallback onCameraTapped;
  final VoidCallback onGalleryTapped;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p15),
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.image,
                  color: AppColors.blue,
                  size: AppSize.s30,
                ),
                title: Text(
                  AppStrings.galleryImport,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: AppSize.s22,
                ),
                onTap: onGalleryTapped,
              ),
              ListTile(
                leading: const Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.blue,
                  size: AppSize.s30,
                ),
                title: Text(
                  AppStrings.cameraImport,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: AppSize.s22,
                ),
                onTap: onCameraTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
