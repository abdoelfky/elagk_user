import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/drawer/data/models/elagk_store/elagk_store_category_model.dart';
import 'package:elagk/drawer/data/models/elagk_store/elagk_store_product_model.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'elagk_store_state.dart';

class ElagkStoreCubit extends Cubit<ElagkStoreState> {
  ElagkStoreCubit() : super(ElagkStoreInitial());


  static ElagkStoreCubit get(context) => BlocProvider.of(context);

  List<ElagkStoreCategoryModel> categories = [];

  Future<void> getCategories({required int SuperCategoryId}) async {
    categories = [];
    emit(GetElagkStoreCategoriesLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: ApiConstants.getCategoryBySuperCategoryId(SuperCategoryId));

      categories = (response.data as List)
          .map((x) => ElagkStoreCategoryModel.fromJson(x))
          .toList();
      selectedCategoryName = categories.first.categoryName!;

      emit(GetElagkStoreCategoriesSuccessState());
    } catch (error, stacktrace) {
      emit(GetElagkStoreCategoriesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  List<ElagkStoreProductModel> products = [];

  Future<void> getProducts({required int pharmacyId,
    required String categoryName}) async {
    products = [];
    emit(GetElagkStoreProductiesLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: ApiConstants.productsByCategoryAndIDPath(
              pharmacyId, categoryName));
      products =(response.data as List).map((x) =>
          ElagkStoreProductModel.fromJson(x)).toList();
      emit(GetElagkStoreProductiesSuccessState());
    } catch (error, stacktrace) {
      emit(GetElagkStoreProductiesErrorState(error.toString()));

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
