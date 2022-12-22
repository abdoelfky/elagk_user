
import 'package:flutter/material.dart';

import '../../../shared/utils/app_values.dart';

class MedicineSpace extends StatelessWidget {
  const MedicineSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: mediaQueryHeight(context) / AppSize.s50);
  }
}
