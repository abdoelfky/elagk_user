import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';

import '../../../../shared/utils/app__fonts.dart';
import '../../../../shared/utils/app_routes.dart';
import '../../../../shared/utils/app_values.dart';

class OffersPharmacy extends StatelessWidget {
  const OffersPharmacy({
    Key? key,
    required this.categoriesName,
    required this.categoriesPrice,
    required this.oldcategoriesPrice,
    required this.imageSrc,
    required this.onTap,
  }) : super(key: key);

  final String categoriesName;
  final String categoriesPrice;
  final String oldcategoriesPrice;
  final String imageSrc;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onTap,
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
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      child: const Image(
                        image: AssetImage(
                          "assets/images/medicine.jpg",
                        ),
                        width: double.infinity,
                        height: AppSize.s70,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 7,
                          right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.red,
                        ),

                        width: 40,
                        height: 20,
                        child: const Center(
                          child: Text('50 % خصم ',style: TextStyle(
                            fontSize: 7,
                            color: Colors.white
                          ),),
                        ),
                      ),
                    )

                  ],
                )),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
            Text(
              categoriesName,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s150),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Text(
                    categoriesPrice,
                    style: const TextStyle(
                        fontSize: FontSize.s11, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: mediaQueryHeight(context) / AppSize.s50),
                  Text(
                    oldcategoriesPrice,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
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
                },
                child: const Text('اضف الي العربة',
                    style: TextStyle(fontSize: 10, color: AppColors.shadow)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
