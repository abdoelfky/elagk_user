import 'package:elagk_pharmacy/core/utils/app_assets.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportProductImage extends StatelessWidget {
  const ImportProductImage({
    Key? key,
    required this.onTap,
  }) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppMargin.m16),
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p18,
          vertical: AppPadding.p4,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s15),
          border: Border.all(
            width: AppSize.s0_5,
            color: Colors.black,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppStrings.productPicture,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            // show the picked image if it exists.
            BlocBuilder<MedicineBloc, MedicineState>(
              builder: (context, state) {
                return Flexible(
                  child: state.medicineImage != null
                      ? Image.file(state.medicineImage!)
                      : const SizedBox(),
                );
              },
            ),
            Flexible(
              child: Image.asset(
                ImageAssets.importImage,
                height: AppSize.s35,
                width: AppSize.s35,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
