import 'package:elagk_pharmacy/drawer/presentation/components/add_medicine/add_medicine_content_widget.dart';
import 'package:flutter/material.dart';

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
