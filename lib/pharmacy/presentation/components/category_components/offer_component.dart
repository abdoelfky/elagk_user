import 'package:elagk/basket/basket_presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductComponent extends StatelessWidget {
  ProductComponent({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PharmacyProductiesCubit, PharmacyProductiesStates>(
  builder: (context, state) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: AppSize.s170,
        width: AppSize.s110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        child: Column(
          children: [
            Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  child: Image(
                    image: NetworkImage(
                      "${PharmacyProductiesCubit.get(context).producties[index].imageUrl}",
                    ),
                    width: AppSize.s70,
                    height: AppSize.s70,
                  ),
                )),
            SizedBox(
                height: mediaQueryHeight(context) / AppSize.s120),
            Text(
              PharmacyProductiesCubit.get(context)
                  .producties[index]
                  .productName!,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(
                height: mediaQueryHeight(context) / AppSize.s150),
            Text(
              '${PharmacyProductiesCubit.get(context).producties[index].price.toString()} جنيه ',
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(
                  fontSize: FontSize.s11,
                  fontWeight: FontWeightManager.light),
            ),
            SizedBox(
                height: mediaQueryHeight(context) / AppSize.s60),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: const LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff1d938c),
                        Color(0xff1c72b5),
                      ])),
              width: AppSize.s110,
              height: AppSize.s30,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(AppPadding.p15),
                ),
                onPressed: () {
                  BasketCubit.get(context).AddToCart(
                      productModel:
                      PharmacyProductiesCubit.get(context)
                          .producties[index]);
                },
                child: const Text('اضف الي العربة',
                    style: TextStyle(
                        fontSize: 10, color: AppColors.shadow)),
              ),
            )
          ],
        ),
      ),
    );
  },
);
  }
}
