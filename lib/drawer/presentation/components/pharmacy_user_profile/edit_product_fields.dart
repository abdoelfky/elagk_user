import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class ContentTitleField extends StatelessWidget {
  const ContentTitleField({Key? key, required this.newAmountController,}) : super(key: key);
  final TextEditingController newAmountController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: newAmountController,
      autofocus: true,
      keyboardType: TextInputType.text,
      decoration: const InputDecoration(
        labelText: AppStrings.newQuantity,
      ),
    );
  }
}

class ContentPriceField extends StatelessWidget {
  const ContentPriceField({Key? key, required this.newPriceController,}) : super(key: key);

  final TextEditingController newPriceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: newPriceController,
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: AppStrings.newPrice,
      ),
    );
  }
}

