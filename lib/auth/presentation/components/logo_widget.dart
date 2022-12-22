import 'package:flutter/material.dart';

import '../../../shared/utils/app_assets.dart';
import '../../../shared/utils/app_values.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAssets.elagkWord,
      height: mediaQueryHeight(context) / AppSize.s8,
      fit: BoxFit.cover,
    );
  }
}
