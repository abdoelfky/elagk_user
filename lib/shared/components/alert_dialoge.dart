import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class alertDialog extends StatelessWidget {
  alertDialog({
    required this.imageSrc,
    required this.text,
    Key? key}) : super(key: key);
  final String imageSrc;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPadding.p28),
      ),
      elevation: 50.0,
      content: Container(
        height: mediaQueryHeight(context)*.32,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: mediaQueryWidth(context) * .4,
              height: mediaQueryHeight(context)* .2,
              child:
              Lottie.asset(imageSrc),

            ),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s100),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(text,
                style: TextStyle(
                    fontSize: 17.5,
                    fontWeight: FontWeight.bold
                ),),
            )
          ],
        ),
      ),
    );
  }
}