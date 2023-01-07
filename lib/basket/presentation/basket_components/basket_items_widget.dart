import 'package:elagk/basket/presentation/basket_controller/basket_cubit.dart';
import 'package:elagk/basket/presentation/basket_controller/basket_states.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/app__fonts.dart';
import '../../../../shared/utils/app_values.dart';


class BasketPharmacy extends StatelessWidget {
  const BasketPharmacy({
    Key? key,
    required this.categoriesName,
    required this.imageSrc,
    required this.Basket,
    required this.index
  }) : super(key: key);

  final String categoriesName;
  final double Basket;
  final String imageSrc;
  final int index;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit,BasketStates>(
      listener: (context,state){},
      builder: (context,state){
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: AppSize.s150,
              width: AppSize.s190,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.s15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.s25),
                    child: Image(
                      image: NetworkImage(
                        '${imageSrc}',
                      ),
                      width: 80,
                      height: 120,
                    ),
                  ),
                  SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          categoriesName,
                          style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        ),
                        SizedBox(height: mediaQueryHeight(context) / AppSize.s150),
                        Text(
                          '$Basket جنيه ',
                          style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),),
                        SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
                        Row(
                          children: [
                            InkWell(
                              child: Container(

                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.offWhite,
                                  borderRadius: BorderRadius.circular(50),
                                ),

                                child: const Center(
                                  child: Icon(
                                      Icons.add
                                  ),
                                ),
                              ),
                              onTap: (){
                                BasketCubit.get(context).plus(index: index);
                              },
                            ),
                            SizedBox(width: mediaQueryHeight(context) / AppSize.s60),
                            Text(
                              '${BasketCubit.get(context).basketProducts[index].quantity}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: mediaQueryHeight(context) / AppSize.s60),
                            InkWell(

                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.offWhite,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: const Icon(
                                    Icons.remove
                                ),
                              ),
                              onTap: (){
                                BasketCubit.get(context).minus(index: index);
                              },
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                  SizedBox(width: mediaQueryHeight(context) / AppSize.s15),
                  InkWell(
                    child: Container(

                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: AppColors.offWhite,
                        borderRadius: BorderRadius.circular(50),
                      ),

                      child: const Center(
                        child: Icon(
                            Icons.delete,color: Colors.red,
                        ),
                      ),
                    ),
                    onTap: (){
                      BasketCubit.get(context).removeFromCart(index: index);
                    },
                  ),

                ],
              ),
            ),
          ),
        ); },


    );
  }
}
