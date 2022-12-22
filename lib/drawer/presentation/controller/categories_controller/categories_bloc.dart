import 'dart:async';
import 'package:elagk_pharmacy/core/local/cache_helper.dart';
import 'package:elagk_pharmacy/core/usecase/base_usecase.dart';
import 'package:elagk_pharmacy/core/utils/app_constants.dart';
import 'package:elagk_pharmacy/core/utils/enums.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/category_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/entities/medicine_entity.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_categories_usecase.dart';
import 'package:elagk_pharmacy/drawer/domain/usecases/get_medicines_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  final GetMedicinesUseCase getMedicinesUseCase;

  CategoriesBloc(
    this.getCategoriesUseCase,
    this.getMedicinesUseCase,
  ) : super(const CategoriesState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<ChangeCategoryIndexEvent>(_changeCategoryIndex);
    on<SelectCategoryEvent>(_selectCategory);
    on<GetMedicinesEvent>(_getMedicines);
  }

  FutureOr<void> _selectCategory(
      SelectCategoryEvent event, Emitter<CategoriesState> emit) {
    emit(state.copyWith(selectedCategory: event.categoryName));
  }

  FutureOr<void> _getCategories(
      GetCategoriesEvent event, Emitter<CategoriesState> emit) async {
    final result = await getCategoriesUseCase(const NoParameters());
    result.fold(
      (l) {
        emit(
          state.copyWith(
            categoryRequestState: RequestState.error,
            categoryMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            categoryRequestState: RequestState.loaded,
            category: r,
            categoriesName: r.map((e) => e.categoryName).toList(),
          ),
        );
      },
    );
  }

  FutureOr<void> _changeCategoryIndex(
      ChangeCategoryIndexEvent event, Emitter<CategoriesState> emit) async {
    emit(
      state.copyWith(selectedIndex: event.index),
    );
  }

  FutureOr<void> _getMedicines(
    GetMedicinesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    final result = await getMedicinesUseCase(
      GetMedicinesParameters(
        pharmacyId: CacheHelper.getData(key: AppConstants.pharmacyId),
        categoryName: event.categoryName,
      ),
    );
    result.fold(
      (l) {
        emit(
          state.copyWith(
            medicinesRequestState: RequestState.error,
            medicinesMessage: l.message,
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            medicinesRequestState: RequestState.loaded,
            medicines: r,
          ),
        );
      },
    );
  }
}
