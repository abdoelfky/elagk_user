import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';

class SendButton extends StatelessWidget {
  const SendButton({
    Key? key,
    required this.deliveryPriceController,
    required this.priceController,
  }) : super(key: key);
  final TextEditingController deliveryPriceController;
  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: const Text(AppStrings.send),
      onPressed: () {
        // TODO.
        debugPrint("delivery price is : ${deliveryPriceController.text}");
        debugPrint("order price is : ${priceController.text}");
        /*cubit.finishOrder(
            cubit.oneOrderModel!.data!.id.toString(),
            context,
            deliveryPriceController.text.toString(),
            priceController.text.toString());*/
        debugPrint("Proceess editing finish");
        Navigator.of(context).pop(false);
      },
    );
  }
}
