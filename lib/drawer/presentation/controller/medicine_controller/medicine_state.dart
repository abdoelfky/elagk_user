part of 'medicine_bloc.dart';

class MedicineState extends Equatable {
  // Medicine
  final Medicine? medicine;
  final RequestState medicineRequestState;
  final ButtonState medicineButtonState;
  final String medicineMessage;
  final File? medicineImage;

  // Update medicine controllers.
  /*final TextEditingController? productNameController;
  final TextEditingController? productDetailsController;
  final TextEditingController? productPriceController;
  final TextEditingController? discountPercentController;
  final TextEditingController? categoryNameController;
  final TextEditingController? quantityController;
  final TextEditingController? doseController;*/

  const MedicineState({
    this.medicine,
    this.medicineRequestState = RequestState.loading,
    this.medicineButtonState = ButtonState.static,
    this.medicineMessage = '',
    this.medicineImage,
    // Update medicine controllers.
   /* this.productNameController,
    this.productDetailsController,
    this.productPriceController,
    this.discountPercentController,
    this.categoryNameController,
    this.quantityController,
    this.doseController,*/
  });

  MedicineState copyWith({
    Medicine? medicine,
    RequestState? medicineRequestState,
    ButtonState? medicineButtonState,
    String? medicineMessage,
    File? medicineImage,
    // Update medicine controllers.
    /*TextEditingController? productNameController,
    TextEditingController? productDetailsController,
    TextEditingController? productPriceController,
    TextEditingController? discountPercentController,
    TextEditingController? categoryNameController,
    TextEditingController? quantityController,
    TextEditingController? doseController,*/
  }) {
    return MedicineState(
      medicine: medicine ?? this.medicine,
      medicineRequestState: medicineRequestState ?? this.medicineRequestState,
      medicineButtonState: medicineButtonState ?? this.medicineButtonState,
      medicineMessage: medicineMessage ?? this.medicineMessage,
      medicineImage: medicineImage ?? this.medicineImage,
      // Update medicine controllers.
      /*productNameController: productNameController ?? this.productNameController,
      productDetailsController: productDetailsController ?? this.productDetailsController,
      productPriceController: productPriceController ?? this.productPriceController,
      discountPercentController: discountPercentController ?? this.discountPercentController,
      categoryNameController: categoryNameController ?? this.categoryNameController,
      quantityController: quantityController ?? this.quantityController,
      doseController: doseController ?? this.doseController,*/
    );
  }

  @override
  List<Object?> get props => [
        medicine,
        medicineRequestState,
        medicineButtonState,
        medicineMessage,
        medicineImage,
        // Update medicine controllers.
        /*productNameController,
        productDetailsController,
        productPriceController,
        discountPercentController,
        categoryNameController,
        quantityController,
        doseController,*/
      ];
}
