import 'dart:async';
import 'dart:io';

import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/app_routes.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/core/utils/navigation.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/add_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/delete_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicine_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/update_medicine_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'medicine_event.dart';

part 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final AddMedicineUseCase addMedicineUseCase;
  final DeleteMedicineUseCase deleteMedicineUseCase;
  final GetMedicineUseCase getMedicineUseCase;
  final UpdateMedicineUseCase updateMedicineUseCase;

  MedicineBloc(
    this.addMedicineUseCase,
    this.deleteMedicineUseCase,
    this.getMedicineUseCase,
    this.updateMedicineUseCase,
  ) : super(const MedicineState()) {
    on<AddMedicineEvent>(_addMedicine);
    on<DeleteMedicineEvent>(_deleteMedicine);
    on<GetMedicineEvent>(_getMedicine);
    on<UpdateMedicineEvent>(_updateMedicine);
    // on<InitTextControllersEvent>(_initTextControllers);
  }

  final ImagePicker picker = ImagePicker();

  pickImage(ImageSource source) async {
    var pickedImage = await picker.pickImage(source: source);
    if (pickedImage != null) {
      emit(
        state.copyWith(
          medicineImage: File(pickedImage.path),
        ),
      );
    }
  }

  FutureOr<void> _addMedicine(
      AddMedicineEvent event, Emitter<MedicineState> emit) async {
    emit(state.copyWith(medicineButtonState: ButtonState.loading));
    final result = await addMedicineUseCase(
      AddMedicineParameters(
        userId: CacheHelper.getData(key: AppConstants.userId),
        pharmacyId: CacheHelper.getData(key: AppConstants.pharmacyId),
        productName: event.productName,
        productDescription: event.productDescription!,
        productPrice: event.productPrice!,
        discountPercent: event.discountPercent!,
        productImage: state.medicineImage,
        categoryName: event.categoryName ??
            CacheHelper.getData(key: AppConstants.defaultCategory),
        quantity: event.quantity,
        dose: event.dose,
        createdAt: event.createdAt!,
      ),
    ).then((value) {
      navigateFinalTo(
        context: event.context,
        screenRoute: Routes.homeDrawerScreen,
      );
      emit(state.copyWith(
        medicineButtonState: ButtonState.static,
        medicineImage: null,
      ));
    });
    result.fold(
      (l) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.error,
            medicineMessage: l.message,
            medicineButtonState: ButtonState.static,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.loaded,
            medicineButtonState: ButtonState.static,
            medicine: r,
          ),
        );
        navigateFinalTo(
          context: event.context,
          screenRoute: Routes.homeDrawerScreen,
        );
      },
    );
  }

  FutureOr<void> _deleteMedicine(
      DeleteMedicineEvent event, Emitter<MedicineState> emit) async {
    final result = await deleteMedicineUseCase(
      DeleteMedicineParameters(id: event.id),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.error,
            medicineMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.loaded,
          ),
        );
        navigateFinalTo(
          context: event.context,
          screenRoute: Routes.homeDrawerScreen,
        );
      },
    );
  }

  FutureOr<void> _getMedicine(
      GetMedicineEvent event, Emitter<MedicineState> emit) async {
    final result = await getMedicineUseCase(
      GetMedicineParameters(id: event.id),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.error,
            medicineMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.loaded,
            medicine: r,
          ),
        );
      },
    );
  }

  FutureOr<void> _updateMedicine(
      UpdateMedicineEvent event, Emitter<MedicineState> emit) async {
    emit(state.copyWith(medicineButtonState: ButtonState.loading));

    final result = await updateMedicineUseCase(
      UpdateMedicineParameters(
        userId: CacheHelper.getData(key: AppConstants.userId),
        pharmacyId: CacheHelper.getData(key: AppConstants.pharmacyId),
        productId: event.productId,
        productName: event.productName,
        productDescription: event.productDescription!,
        productPrice: event.productPrice!,
        discountPercent: event.discountPercent!,
        productImage: state.medicineImage ?? null,
        imageUrl: state.medicineImage == null ? event.imageUrl : null,
        // it can be null.
        // it can be Null
        quantity: event.quantity!,
        // point: event.point!,
        dose: event.dose,
        categoryId: event.categoryId,
        categoryName: event.categoryName,
        createdAt: event.createdAt,
      ),
    ).then((value) {
      navigateFinalTo(
        context: event.context,
        screenRoute: Routes.homeDrawerScreen,
      );
      emit(state.copyWith(
        medicineButtonState: ButtonState.static,
        medicineImage: null,
      ));
    });
    result.fold(
      (l) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.error,
            medicineButtonState: ButtonState.static,
            medicineMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            medicineRequestState: RequestState.loaded,
            medicineButtonState: ButtonState.static,
            medicine: r,
          ),
        );
        navigateFinalTo(
          context: event.context,
          screenRoute: Routes.homeDrawerScreen,
        );
      },
    );
  }

// Update medicine controllers.
/*TextEditingController? productNameController;
      TextEditingController? productDetailsController;
  TextEditingController? productPriceController;
      TextEditingController? discountPercentController;
  TextEditingController? categoryNameController;
      TextEditingController? quantityController;
  TextEditingController? doseController;

  // to use initialValue & controllers in the same time.
  FutureOr<void> _initTextControllers(
      InitTextControllersEvent event, Emitter<MedicineState> emit) {
    // emit(state.copyWith(
        productNameController= TextEditingController(text: event.productName);
        productDetailsController= TextEditingController(text: event.productDetails);
        productPriceController= TextEditingController(text: event.productPrice);
        discountPercentController= TextEditingController(text: event.discountPercent);
        categoryNameController= TextEditingController(text: event.categoryName);
        quantityController= TextEditingController(text: event.quantity);
        doseController= TextEditingController(text: event.dose);
      // ),
    // );
  }*/
}
