import 'package:elagk/basket/presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/drawer/presentation/controller/elagk_store_controller/elagk_store_cubit.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElagkStoreProductComponent extends StatelessWidget {
  ElagkStoreProductComponent({Key? key, required this.index,
    required this.pharmacyId, required this.search}) : super(key: key);
  final int index;
  final int pharmacyId;
  final bool search;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElagkStoreCubit, ElagkStoreState>(
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
                SizedBox(height: 5,),

                Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      child: Image(
                        image: NetworkImage(
                          !search?"${ElagkStoreCubit
                              .get(context).products[index].imageUrl}":
                          "${ElagkStoreCubit
                              .get(context).searchResult[index].imageUrl}"
                          ,
                        ),
                        width: AppSize.s70,
                        height: AppSize.s70,
                      ),
                    )),
                SizedBox(
                    height: mediaQueryHeight(context) / AppSize.s120),
                Text(
                  !search?ElagkStoreCubit.get(context)
                      .products[index]
                      .productName!:
                  ElagkStoreCubit.get(context)
                      .searchResult[index]
                      .productName!,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                    height: mediaQueryHeight(context) / AppSize.s150),
                Text(
                  '${ElagkStoreCubit.get(context).products[index].price.toString()} جنيه ',
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
                      if(BasketCubit.get(context).pharmacyId==pharmacyId
                          ||BasketCubit.get(context).pharmacyId==null){
                        BasketCubit.get(context).AddToCart(
                            productModel:
                            !search?ElagkStoreCubit.get(context)
                                .products[index]:
                            ElagkStoreCubit.get(context)
                                .searchResult[index],
                            phId: pharmacyId,
                            dist: '0'
                        );
                      }else
                      {
                        BasketCubit.get(context).deleteCartProducts();
                        BasketCubit.get(context).AddToCart(
                            productModel:
                            !search?(ElagkStoreCubit.get(context)
                                .products[index] ):
                            ElagkStoreCubit.get(context)
                                .searchResult[index],
                            phId: pharmacyId,
                            dist: '0'
                        );

                      }
                    },
                    child: const Text('اضف الي العربة',
                        style: TextStyle(
                            fontSize: 10,
                            color: AppColors.shadow)),
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
