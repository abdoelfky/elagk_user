import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class DeliveryPriceField extends StatelessWidget {
  const DeliveryPriceField({Key? key, required this.deliveryPriceController}) : super(key: key);

  final TextEditingController deliveryPriceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: deliveryPriceController,
      autofocus: true,
      keyboardType: TextInputType.name,
      decoration: const InputDecoration(
        labelText: AppStrings.deliverPrice,
      ),
    );
  }
}

class PriceField extends StatelessWidget {
  const PriceField({Key? key, required this.priceController}) : super(key: key);

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: priceController,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: AppStrings.prescriptionPrice,
        ));
  }
}
