import 'package:fancy_cart/fancy_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_values.dart';
import 'basket_items_widget.dart';

class BasketProducts extends StatelessWidget {
  const BasketProducts({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;
  @override
  Widget build(BuildContext context) {
    return CartWidget(
      cartBuilder: (controller) {
        return ListView.builder(
          physics:  NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.cartList.length,
          itemBuilder: (BuildContext context, int index) {
            final cartItem = controller.cartList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: AppSize.s150,
                width: AppSize.s220,
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
                          const Text(
                            'categoriesName',
                            style:TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20
                            ),
                          ),
                          SizedBox(height: mediaQueryHeight(context) / AppSize.s150),

                          Text(controller
                              .getPriceForItem(cartItem, updatePrice: true).toString(),
                            style:const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                          ),
                          SizedBox(height: mediaQueryHeight(context) / AppSize.s60),

                          // controller.incrementItemQuantity(cartItem);
                          //cartItem.quantity.toString()
                          // controller.decrementItemQuantity(cartItem);
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
                                  controller.incrementItemQuantity(cartItem);
                                },
                              ),
                              SizedBox(width: mediaQueryHeight(context) / AppSize.s60),
                              Text(
                                cartItem.quantity.toString(),
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
                                  controller.decrementItemQuantity(cartItem);
                                },
                              ),
                            ],
                          ),


                        ],
                      ),
                    ),
                    // controller.removeItem(cartItem);
                    SizedBox(width: mediaQueryHeight(context) / AppSize.s25),
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
                            Icons.restore_from_trash_rounded,color: Colors.red,
                          ),
                        ),
                      ),
                      onTap: (){
                        controller.removeItem(cartItem);
                      },
                    ),

                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
