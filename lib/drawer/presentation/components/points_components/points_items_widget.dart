import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:flutter/material.dart';
import '../../../../shared/utils/app__fonts.dart';
import '../../../../shared/utils/app_values.dart';

class PointsPharmacy extends StatelessWidget {
  const PointsPharmacy({
    Key? key,
    required this.categoriesName,
    required this.points,
    required this.imageSrc,
    required this.onTap,
  }) : super(key: key);

  final String categoriesName;
  final String points;

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
                  ],
                )),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
            Text(
              categoriesName,
              style: Theme.of(context).textTheme.displaySmall,
            ),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s150),
            Text(
              points,
              style: const TextStyle(
                  fontSize: FontSize.s11, fontWeight: FontWeight.bold),
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
                child: const Text(AppStrings.pointsReplace,
                    style: TextStyle(fontSize: 12, color: AppColors.offWhite)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
