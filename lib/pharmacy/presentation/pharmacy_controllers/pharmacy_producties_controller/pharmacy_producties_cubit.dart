import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/pharmacy/data/category_model.dart';
import 'package:elagk/pharmacy/data/product_model.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class PharmacyProductiesCubit extends Cubit<PharmacyProductiesStates> {
  PharmacyProductiesCubit() : super(PharmacyProductiesInitialState());

  static PharmacyProductiesCubit get(context) => BlocProvider.of(context);

  List<CategoryModel> categories = [];

  Future<void> getCategories({required int SuperCategoryId}) async {
    categories = [];
    emit(GetCategoriesLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: ApiConstants.getCategoryBySuperCategoryId(SuperCategoryId));

      categories = (response.data as List)
          .map((x) => CategoryModel.fromJson(x))
          .toList();
      selectedCategoryName = categories.first.categoryName!;

      emit(GetCategoriesSuccessState());
    } catch (error, stacktrace) {
      emit(GetCategoriesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  List<ProductModel> producties = [];

  Future<void> getProducties(
      {required int pharmacyId, required String categoryName}) async {
    producties = [];
    emit(GetProductiesLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: ApiConstants.productsByCategoryAndIDPath(
              pharmacyId, categoryName));
      producties =
          (response.data as List).map((x) => ProductModel.fromJson(x)).toList();
      emit(GetProductiesSuccessState());
    } catch (error, stacktrace) {
      emit(GetProductiesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }


  String selectedCategoryName='';
  void changeSelectedCategory({required String selectedCategory})
  {
    selectedCategoryName=selectedCategory;
    emit(ChangeSelectedCategorySuccessState());
  }






}
