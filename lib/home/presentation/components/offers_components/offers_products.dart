import 'package:elagk/home/presentation/components/offers_components/offers_items_widget.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/product_component.dart';
import 'package:flutter/cupertino.dart';

import '../../../../shared/utils/app_values.dart';


class OffersProducts extends StatefulWidget {
  const OffersProducts({Key? key, required this.firstCategoryName}) : super(key: key);

  final String firstCategoryName;


  @override
  State<OffersProducts> createState() => _OffersProductsState();
}

class _OffersProductsState extends State<OffersProducts> {
  @override


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: AppSize.s150,
          childAspectRatio: AppSize.s7 / AppSize.s10,
          crossAxisSpacing: AppSize.s10,
          mainAxisSpacing: AppSize.s10,
        ),
        itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return OfferComponent(index: index);
      },
    );
  }
}
