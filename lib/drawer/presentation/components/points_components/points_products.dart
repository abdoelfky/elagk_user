import 'package:elagk/drawer/presentation/components/points_components/points_items_widget.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';

import '../../../../shared/utils/app_values.dart';


class PointsProducts extends StatefulWidget {
  const PointsProducts({Key? key, required this.firstCategoryName}) : super(key: key);

  final String firstCategoryName;


  @override
  State<PointsProducts> createState() => _PointsProductsState();
}

class _PointsProductsState extends State<PointsProducts> {
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
        return PointsPharmacy(
          categoriesName: "productName",
          points: '15 نقطة',
          imageSrc: "state.medicines![index].imageUrl ?? AppConstants.empty",
          onTap: () {
          },
        );
      },
    );
  }
}
