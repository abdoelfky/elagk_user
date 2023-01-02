import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'product_item_pharmacy_widget.dart';


class PharmacyProducts extends StatefulWidget {
  const PharmacyProducts({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;


  @override
  State<PharmacyProducts> createState() => _PharmacyProductsState();
}

class _PharmacyProductsState extends State<PharmacyProducts> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PharmacyProductiesCubit, PharmacyProductiesStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state is GetProductiesSuccessState )
          return
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: AppSize.s150,
            childAspectRatio: AppSize.s7 / AppSize.s10,
            crossAxisSpacing: AppSize.s10,
            mainAxisSpacing: AppSize.s10,
          ),
          itemCount: PharmacyProductiesCubit.get(context).producties.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductItemPharmacy(
              categoriesName: PharmacyProductiesCubit.get(context).producties[index].productName!,
              categoriesPrice: '${PharmacyProductiesCubit.get(context).producties[index].price.toString()} جنيه ',
              imageSrc: PharmacyProductiesCubit.get(context).producties[index].imageUrl!,
              onTap: () {},
            );
          },
        );
        else
          return
        CircularProgressIndicator();

      },
    );
  }
}
