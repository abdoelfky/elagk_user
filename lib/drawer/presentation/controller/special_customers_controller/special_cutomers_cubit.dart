import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/drawer/data/models/SpecialCustomerModel.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'special_cutomers_state.dart';

class SpecialCustomersCubit extends Cubit<SpecialCustomersState> {
  SpecialCustomersCubit() : super(SpecialCustomersInitial());
  static SpecialCustomersCubit get(context) => BlocProvider.of(context);

  List<SpecialCustomerModel> specialCustomers=[];
  Future<void> getSpecialCustomers() async {
    specialCustomers = [];
    emit(GetSpecialCustomersLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: ApiConstants.getTopUsers(10));
      specialCustomers = (response.data as List)
          .map((x) => SpecialCustomerModel.fromJson(x))
          .toList();
      specialCustomers=specialCustomers.reversed.toList();

      emit(GetSpecialCustomersSuccessState(specialCustomers));
    } catch (error, stacktrace) {
      emit(GetSpecialCustomersErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

}
