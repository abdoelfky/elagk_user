import 'dart:developer';

import 'package:dotted_line/dotted_line.dart';
import 'package:fancy_cart/fancy_cart.dart';
import 'package:flutter/material.dart';
import '../../../../auth/presentation/components/MainTextFormField.dart';
import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_strings.dart';
import '../../../../shared/utils/app_values.dart';
import 'basket_products.dart';
import 'basket_salary.dart';

class BasketSection extends StatelessWidget {
  const BasketSection({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;
  static final _discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CartWidget(
      cartBuilder: (controller) {
        return Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
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
                          child:  Image(
                            image: AssetImage(
                              cartItem.image,
                            ),
                            width: 120,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                            height: mediaQueryHeight(context) / AppSize.s120),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               Text(
                                cartItem.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(
                                  height:
                                      mediaQueryHeight(context) / AppSize.s150),

                              Text(
                                controller
                                    .getPriceForItem(cartItem,
                                        updatePrice: true)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                  height:
                                      mediaQueryHeight(context) / AppSize.s60),

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
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                    onTap: () {
                                      controller
                                          .incrementItemQuantity(cartItem);
                                    },
                                  ),
                                  SizedBox(
                                      width: mediaQueryHeight(context) /
                                          AppSize.s60),
                                  Text(
                                    cartItem.quantity.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      width: mediaQueryHeight(context) /
                                          AppSize.s60),
                                  InkWell(
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        color: AppColors.offWhite,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Icon(Icons.remove),
                                    ),
                                    onTap: () {
                                      controller
                                          .decrementItemQuantity(cartItem);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // controller.removeItem(cartItem);
                        SizedBox(
                            width: mediaQueryHeight(context) / AppSize.s25),
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
                                Icons.delete,
                                color: AppColors.red,
                              ),
                            ),
                          ),
                          onTap: () {
                            controller.removeItem(cartItem);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.addDiscountCode,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MainTextFormField(
                    controller: _discountController,
                    label: AppStrings.discountCode,
                    hint: AppStrings.discountCodeExample,
                    hintColor: Colors.white,
                    focusColor: Colors.white,
                    inputType: TextInputType.visiblePassword,
                    textDirection: TextDirection.ltr,
                    obscure: false,
                    icon: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green[700]),
                        child: const Center(
                            child: Text(
                          AppStrings.active,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                      ),
                    ),
                    validator: (value) {
                      // if (value!.length < AppSize.s8) {
                      //   return AppStrings.enterValidPassword;
                      // } else {
                      //   return null;
                      // }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Text(
                        "السعر",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Spacer(),
                      Text(
                        "${controller.getTotalPrice()} جنية ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                  Row(
                    children: const [
                      Text(
                        "الديلفري",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Spacer(),
                      Text(
                        "30 جنية",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                  const DottedLine(
                      dashColor: Colors.grey,
                      dashLength: 11,
                      dashGapLength: 10),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s50),
                  Row(
                    children:  [
                      const Text(
                        "اجمالي السعر",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      const Spacer(),
                      Text(
                        "${controller.getTotalPrice()+30} جنية ",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AddToCartButton(
              actionAfterAdding: () {
                log("item added", name: "item added");
              },
              cartModel: CartItem(
                  id: DateTime.now().millisecondsSinceEpoch,
                  name: 'Test',
                  price: 100,
                  image: ""),
              child: Container(
                height: 50,
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Add to cart",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
                width: double.infinity,
                height: AppSize.s60,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppPadding.p15),
                  ),
                  onPressed: () => {},
                  color: AppColors.offBlue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.buy,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                )),
          ],
        );
      },
    );
  }
}
