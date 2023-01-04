import 'package:elagk/basket/basket_presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/basket/basket_presentation/basket_controller/basket_states.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarBasketIcon extends StatelessWidget {
  const AppBarBasketIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit,BasketStates>(
      builder: (context, state) {
        return Container(
          child: Stack(
            children: [
              Image.asset(
                'assets/images/order/basket.png',
                height: 30,
                width: 30,
              ),
              Positioned(
                bottom:AppSize.s14 ,
                left: AppSize.s14,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red,
                  ),
                  width: AppSize.s16,
                  height: AppSize.s16,
                  child: Center(
                    child: Text('${BasketCubit
                        .get(context)
                        .basketProducts
                        .length}', style: TextStyle(
                        fontSize: 9,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
