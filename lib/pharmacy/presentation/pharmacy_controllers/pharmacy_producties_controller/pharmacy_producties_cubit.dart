import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/data/product_model.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class PharmacyProductiesCubit extends Cubit<PharmacyProductiesStates> {
  PharmacyProductiesCubit() : super(PharmacyProductiesInitialState());
  static PharmacyProductiesCubit get(context) => BlocProvider.of(context);


  List<ProductModel> producties = [];

  Future<void> getPharmacies() async {
    producties = [];
    emit(GetProductiesLoadingState());
    try {
      Response response = await DioHelper.getData(url: ApiConstants.products);
      producties = (response.data as List)
          .map((x) => ProductModel.fromJson(x))
          .toList();
      emit(GetProductiesSuccessState());
    } catch (error, stacktrace) {
      emit(GetProductiesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }


}
