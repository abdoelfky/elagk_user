import 'package:flutter/material.dart';

import '../../../../shared/utils/app_values.dart';

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: mediaQueryHeight(context) / AppSize.s50);
  }
}
