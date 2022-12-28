import 'package:elagk/drawer/presentation/controller/basket_controller/basket_cubit.dart';
import 'package:elagk/drawer/presentation/controller/basket_controller/basket_states.dart';
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
  }) : super(key: key);

  final String categoriesName;
  final String Basket;
  final String imageSrc;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BasketCubit,BasketStates>(
      listener: (context,state){},
      builder: (context,state){
        return Padding(
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  child: const Image(
                    image: AssetImage(
                      "assets/images/profile/r.png",
                    ),
                    width: 120,
                    height: 200,
                  ),
                ),
                SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
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
                        Basket,
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
                              BasketCubit.get(context).plus();
                            },
                          ),
                          SizedBox(width: mediaQueryHeight(context) / AppSize.s60),
                          Text(
                            '${BasketCubit.get(context).counter}',
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
                              BasketCubit.get(context).minus();
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
                          Icons.highlight_remove_sharp,color: Colors.red,
                      ),
                    ),
                  ),
                  onTap: (){
                    BasketCubit.get(context).plus();
                  },
                ),

              ],
            ),
          ),
        ); },


    );
  }
}
