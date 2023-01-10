import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  ScreenBackground({Key? key,required this.child, required this.textDirection }) : super(key: key);

  final Widget child;
  final TextDirection textDirection;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: mediaQueryHeight(context),
        width: mediaQueryWidth(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageAssets.background),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
