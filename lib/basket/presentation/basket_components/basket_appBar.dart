import 'package:elagk/basket/presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget BasketAppBar({
  required BuildContext context,
  required String title,

}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black)),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: IconButton(
            onPressed: () {
              BasketCubit.get(context).deleteCartProducts();
            },
            icon: Icon(Icons.delete,color: Colors.red,size: 30,),
          ),
        ),
      ],
    );
