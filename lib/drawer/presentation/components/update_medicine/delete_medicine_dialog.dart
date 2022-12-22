import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

showWarningDialog({
  required BuildContext context,
  required Function()? onDeletePressed,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          AppStrings.confirmDeleteProduct,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(AppStrings.cancel),
          ),
          TextButton(
            onPressed: onDeletePressed,
            child: const Text(AppStrings.delete),
          ),
        ],
      );
    },
  );
}
