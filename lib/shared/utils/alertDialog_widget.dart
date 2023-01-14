import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_values.dart';

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
        height: mediaQueryHeight(context)/AppSize.s6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                imageSrc,

              ),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(height: mediaQueryHeight(context) / AppSize.s40),
             Text(text,

              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
              ),)
          ],
        ),
      ),
    );
  }
}
