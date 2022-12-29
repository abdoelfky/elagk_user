import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitialState());


  static  HomeScreenCubit get(context) => BlocProvider.of(context);

  List<PharmacyModel> pharmacies=[];

  Future<void> getPharmacies() async {
    emit(GetPharmaciesLoadingState());
    try {
      Response response = await DioHelper.getData( url:ApiConstants.pharmacies);
      pharmacies=(response.data as List)
          .map((x) => PharmacyModel.fromJson(x))
          .toList();
      emit(GetPharmaciesSuccessState());

    } catch (error, stacktrace) {
      emit(GetPharmaciesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");

    }
  }

}
