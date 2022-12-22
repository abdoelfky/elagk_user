import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProductButton extends StatelessWidget {
  const EditProductButton({
    Key? key,
    required this.formKey,
    required this.newAmountController,
    required this.newPriceController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController newAmountController;
  final TextEditingController newPriceController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        return MaterialButton(
          child: const Text(AppStrings.edit),
          onPressed: () {
            debugPrint("Proceess editing start");
            // TODO.
            if (formKey.currentState!.validate()) {
              /*context.read<MedicineBloc>().add(UpdateMedicineEvent(
                    // productId: productId,
                    // productName: productName,
                  ));*/
              /*cubit.pharmacyEditMedicines(
                  cubit.pharmacyMedicinesModel!.paginate!.data![index].id
                      .toString(),
                  newPriceController.text,
                  newAmountController.text,
                  context,
                );*/
            }
            debugPrint("Proceess editing finish");
            Navigator.of(context).pop(false);
          },
        );
      },
    );
  }
}

class CancelDialogButton extends StatelessWidget {
  const CancelDialogButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        child: const Text(AppStrings.cancel),
        onPressed: () => Navigator.of(context).pop(false));
  }
}
