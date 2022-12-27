import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:flutter/material.dart';
import '../shared/utils/app__fonts.dart';
import '../shared/utils/app_values.dart';

class ProductItemPharmacy extends StatelessWidget {
  const ProductItemPharmacy({
    Key? key,
    required this.productName,
    required this.productPrice,
    required this.imageSrc,
    required this.onTap,
  }) : super(key: key);

  final String productName;
  final String productPrice;
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
                child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s15),
              child: DefaultNetworkImage(
                height: AppSize.s70,
                width: double.infinity,
                imageSrc: imageSrc,
                padding: AppPadding.p0,
              ),
            )),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
            Text(
              productName,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s150),
            Text(
              productPrice,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: FontSize.s11, fontWeight: FontWeightManager.light),
            ),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
            SizedBox(
                width: AppSize.s110,
                height: AppSize.s30,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppPadding.p15),
                  ),
                  onPressed: () {},
                  color: AppColors.offBlue,
                  child: const Text('اضف الي العربة',
                      style:TextStyle(
                        fontSize: 10,
                        color: AppColors.shadow
                      )),
                ),
            )
          ],
        ),
      ),
    );
  }
}
