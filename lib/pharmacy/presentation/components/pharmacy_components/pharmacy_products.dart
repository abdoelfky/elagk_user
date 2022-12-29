import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'product_item_pharmacy_widget.dart';


class PharmacyProducts extends StatefulWidget {
  const PharmacyProducts({Key? key, required this.firstCategoryName}) : super(key: key);

  final String firstCategoryName;


  @override
  State<PharmacyProducts> createState() => _PharmacyProductsState();
}

class _PharmacyProductsState extends State<PharmacyProducts> {
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
        return ProductItemPharmacy(
          categoriesName: "productName",
          categoriesPrice: "23",
          imageSrc: "state.medicines![index].imageUrl ?? AppConstants.empty",
          onTap: () {
          },
        );
      },
    );
  }
}
