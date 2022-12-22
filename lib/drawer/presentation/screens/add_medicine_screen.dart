 import 'package:flutter/material.dart';

import '../components/add_medicine/add_medicine_content_widget.dart';

class AddNewMedicines extends StatelessWidget {
  const AddNewMedicines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: AddNewMedicineContent(),
      ),
    );
  }
}
