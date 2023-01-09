import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/pharmacy/data/product_model.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit() : super(PointsInitial());
  static PointsCubit get(context) => BlocProvider.of(context);


  int userPoints=0;
  Future<void> getUserPoints() async {
    emit(GetUserPointsLoadingState());
    await DioHelper.getData(
      url: ApiConstants.getUserPointsIdPath(
          CacheHelper.getData(key: AppConstants.userId).toString()),
    ).then((value) {
      userPoints=value.data;
      emit(GetUserPointsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetUserPointsErrorState());
    });
  }

  List<ProductModel> products = [];

  Future<void> getProducts() async {
    products = [];
    emit(GetPointProductsLoadingState());
    try
    {
      Response response = await DioHelper.getData(
          url: ApiConstants.getStoreProducts);
      products =(response.data as List).map((x) =>
          ProductModel.fromJson(x)).toList();
      emit(GetPointProductsSuccessState());
    }catch (error, stacktrace)
    {
      emit(GetPointProductErrorState());
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }


  void changeUserPoints({required int productPoint})
  {
    AppConstants.pointsChanges=true;
    userPoints -= productPoint;
    AppConstants.newPoints=userPoints;
    print(CacheHelper.getData(key: AppConstants.userId));
    emit(UserPointsSuccessState());
  }


}
