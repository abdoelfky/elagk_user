import 'package:elagk/basket/basket_presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/basket/basket_presentation/basket_controller/basket_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/app_values.dart';
import 'basket_items_widget.dart';


class BasketProducts extends StatelessWidget {
  const BasketProducts({Key? key, required this.firstCategoryName}) : super(key: key);

  final String firstCategoryName;


  @override


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketCubit, BasketStates>(
  builder: (context, state) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: BasketCubit.get(context).baskets.length,
      itemBuilder: (BuildContext context, int index) {
        return  BasketPharmacy(
          categoriesName: BasketCubit.get(context).baskets[index].productName!,
         Basket: BasketCubit.get(context).baskets[index].price!,
          imageSrc: BasketCubit.get(context).baskets[index].imageUrl!, index: index,

        );
      },
    );
  },
);
  }
}
