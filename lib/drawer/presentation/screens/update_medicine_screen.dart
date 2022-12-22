import 'package:elagk_pharmacy/core/global/app_colors.dart';
import 'package:elagk_pharmacy/core/utils/app_strings.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/back_appbar_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/error_screen.dart';
import 'package:elagk_pharmacy/drawer/presentation/components/update_medicine/update_medicine_content_widget.dart';
import 'package:elagk_pharmacy/drawer/presentation/controller/medicine_controller/medicine_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateMedicineScreen extends StatelessWidget {
  const UpdateMedicineScreen({
    Key? key,
    required this.productId,
    required this.productName,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.discountPercent,
    required this.categoryId,
    required this.categoryName,
    required this.quantity,
    required this.dose,
  }) : super(key: key);

  final int productId;
  final String productName;
  final String description;
  final String imageUrl;
  final double price;
  final double discountPercent;
  final int categoryId;
  final String categoryName;
  final int quantity;
  final String dose;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: myAppBarWithBack(
            context,
            actionsWidget: const SizedBox(),
            title: AppStrings.editProduct,
            actionsButton: () {},
          ),
          body: BlocBuilder<MedicineBloc, MedicineState>(
            // bloc: sl<MedicineBloc>()..add(GetMedicineEvent(productId)),
            builder: (context, state) { // TODO: don't nedd this switch.
              switch (state.medicineRequestState) {
                case RequestState.loaded:
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primary,
                  ));
                case RequestState.loading:  // TODO: check this case.
                // with constructor
                  return UpdateMedicineContent(
                    productId: productId,
                    productName: productName,
                    description: description,
                    price: price,
                    discountPercent: discountPercent,
                    categoryId: categoryId,
                    categoryName: categoryName,
                    quantity: quantity,
                    dose: dose,
                    imageUrl: imageUrl,
                  );
                case RequestState.error:
                  return const ErrorScreen();
              }
            },
          ),
        ),
      ),
    );
  }
}
