import 'package:flutter/material.dart';

import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_values.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({Key? key,required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQueryHeight(context),
      width: mediaQueryWidth(context),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.background),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
