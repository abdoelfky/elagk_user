import 'package:elagk/drawer/presentation/components/past_orders_components/my_devider_component.dart';
import 'package:elagk/drawer/presentation/components/past_orders_components/order_item_content.dart';
import 'package:flutter/material.dart';

class OrdersContents extends StatelessWidget {
  const OrdersContents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated
      (
        itemBuilder: (context,index)=>OrderItem(context),
        separatorBuilder:  (context,index)=>MyDivider(),
        itemCount: 20
    );
  }
}
