import 'package:elagk_pharmacy/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: mediaQueryHeight(context) / AppSize.s50);
  }
}
