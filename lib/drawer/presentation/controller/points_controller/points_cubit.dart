import 'package:bloc/bloc.dart';
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

}
