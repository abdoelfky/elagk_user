import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        height: mediaQueryHeight(context)/AppSize.s4,
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                imageSrc,

              ),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
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