import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/drawer/data/past_orders_model.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'past_orders_state.dart';

class PastOrdersCubit extends Cubit<PastOrdersStates> {
  PastOrdersCubit() : super(PastOrdersInitialState());
  static PastOrdersCubit get(context) => BlocProvider.of(context);
  List<PastOrdersModel> pastOrders = [];

  Future<void> getPastOrders() async {
    pastOrders = [];
    emit(GetPastOrdersLoadingState());
    try {
      Response response = await DioHelper.getData(
          url: ApiConstants.getUserOrdersByUserId(
              CacheHelper.getData(key: AppConstants.userId)));
      pastOrders = (response.data as List)
          .map((x) => PastOrdersModel.fromJson(x))
          .toList();
      pastOrders=pastOrders.reversed.toList();
      emit(GetPastOrdersSuccessState(pastOrders));
    } catch (error, stacktrace) {
      emit(GetPastOrdersErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
