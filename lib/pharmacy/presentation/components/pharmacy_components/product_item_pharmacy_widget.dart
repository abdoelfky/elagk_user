import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/pharmacy/presentation/components/OrderByPrescriptionComponents/OrderByPrescriptionContent.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/item.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_info.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import '../../../../shared/components/second_appBar.dart';

class ProductItemPharmacy extends StatelessWidget {

  const ProductItemPharmacy({
    Key? key,
    required this.categoriesName,
    required this.categoriesPrice,
    required this.imageSrc,
    required this.onTap,
  }) : super(key: key);

  final String categoriesName;
  final String categoriesPrice;
  final String imageSrc;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onTap,
      child: Directionality(
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
                child:  Image(
                  image: NetworkImage(
                    "${imageSrc}",
                  ),
                  width: double.infinity,
                  height:AppSize.s70,
                ),

              )),
              SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
              Text(
                categoriesName,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              SizedBox(height: mediaQueryHeight(context) / AppSize.s150),
              Text(
                categoriesPrice,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: FontSize.s11, fontWeight: FontWeightManager.light),
              ),
              SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                    gradient:const LinearGradient(

                        begin:Alignment.topRight ,
                        end:Alignment.bottomRight,
                        colors:
                        [

                          Color(0xff1d938c),
                          Color(0xff1c72b5),
                        ])
                ),
                width: AppSize.s110,
                height: AppSize.s30,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppPadding.p15),
                  ),
                  onPressed: () {

                  },

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
      ),
    );
  }
}
