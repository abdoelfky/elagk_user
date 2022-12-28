import 'package:flutter/cupertino.dart';

import '../../../../shared/utils/app_values.dart';
import 'basket_items_widget.dart';


class BasketProducts extends StatefulWidget {
  const BasketProducts({Key? key, required this.firstCategoryName}) : super(key: key);

  final String firstCategoryName;


  @override
  State<BasketProducts> createState() => _BasketProductsState();
}

class _BasketProductsState extends State<BasketProducts> {
  @override


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return const BasketPharmacy(
          categoriesName: "productName",
         Basket: '15 جنية',
          imageSrc: "state.medicines![index].imageUrl ?? AppConstants.empty",

        );
      },
    );
  }
}
