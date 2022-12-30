import 'dart:async';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import '../../../../shared/network/dio_helper.dart';


class CategoriesCubit extends Cubit<CategoriesStates>
{
  CategoriesCubit(): super(CategoriesInitialState());

  static  CategoriesCubit get(context) => BlocProvider.of(context);



  Future<void> ResetPass(

  ) async {
    emit(CategoriesLoadingState());
    await DioHelper.getData(
      url: ApiConstants.categories,

    ).then((value) {
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState(error.toString()));
    });}





}