import 'package:flutter/material.dart';

class AppBarBasketIcon extends StatelessWidget {
  const AppBarBasketIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(

      'assets/images/order/basket.png',
      height: 22,
      width: 22,

    );
  }
}
