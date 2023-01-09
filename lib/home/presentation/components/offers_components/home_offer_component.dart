import 'package:elagk/basket/presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/home/data/models/offer_product_model.dart';
import 'package:elagk/home/data/models/pharmacy_offer_model.dart';
import 'package:elagk/pharmacy/data/product_model.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeOfferComponent extends StatelessWidget {
  HomeOfferComponent({Key? key,required this.offerModel}) : super(key: key);
  final OfferProductModel offerModel;

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
                SizedBox(height: 5,),

                Expanded(
                    child: Stack(

                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(AppSize.s15),
                          child:  Image(
                            image: NetworkImage(
                              "${offerModel.imageUrl}",
                            ),
                            width: AppSize.s70,
                            height: AppSize.s70,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.red,
                          ),
                          width: 50,
                          height: 20,
                          child: Center(
                            child: Text(
                              '${offerModel.discountPercent} % خصم ',
                              style: TextStyle(
                                  fontSize: 7,
                                  color: Colors.white
                              ),),
                          ),
                        ),

                      ],
                    )),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
                Text(
                  offerModel.productName.toString(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s150),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    children: [
                      Text(
                        offerModel.price.toString(),
                        style: const TextStyle(
                            fontSize: FontSize.s11, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: mediaQueryHeight(context) / AppSize.s100),
                      Text(
                          offerModel.price.toString(),
                        style: Theme.of(context)
                            .textTheme.displaySmall!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: FontSize.s11, fontWeight: FontWeightManager.light),

                      ),
                    ],
                  ),
                ),

                SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
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
                      borderRadius: BorderRadius.circular(AppPadding.p15),
                    ),
                    onPressed: () {
                      if(BasketCubit.get(context).pharmacyId==offerModel.pharmacyId
                          ||BasketCubit.get(context).pharmacyId==null){
                        BasketCubit.get(context).AddToCart(
                            productModel: offerModel as ProductModel,
                            phId: offerModel.pharmacyId,
                            dist: AppConstants.distance);
                      }else
                      {
                        BasketCubit.get(context).deleteCartProducts();
                        BasketCubit.get(context).AddToCart(
                            productModel: offerModel as ProductModel,
                            phId: offerModel.pharmacyId,
                            dist: AppConstants.distance);

                      }
                    },
                    child: const Text('اضف الي العربة',
                        style: TextStyle(fontSize: 10, color: AppColors.shadow)),
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
