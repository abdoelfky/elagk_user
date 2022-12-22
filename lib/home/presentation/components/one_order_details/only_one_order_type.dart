import 'package:elagk/home/presentation/components/one_order_details/one_order_item_selected.dart';
import 'package:flutter/material.dart';

class OnlyOneOrderType extends StatelessWidget {
  const OnlyOneOrderType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2, // TODO.
      // itemCount: cubit.oneOrderModel!.data!.medicines!.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return OneOrderItemSelected(
          imageSrc: "Test", // TODO.
          // cubit.oneOrderModel!.data!.medicines![index].photo.toString(),
          orderName: "Test", // TODO.
          // cubit.oneOrderModel!.data!.medicines![index].name.toString(),
          orderItemQuantity: "Test", // TODO.
          // cubit.oneOrderModel!.data!.medicines![index].pivot!.amount.toString(),
          orderItemPrice: "Test", // TODO.
          // cubit.oneOrderModel!.data!.medicines![index].pivot!.price.toString(),
        );
      },
    );
  }
}
