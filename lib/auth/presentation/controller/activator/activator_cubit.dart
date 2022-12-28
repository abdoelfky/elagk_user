import 'dart:async';

import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/dio_helper.dart';

import 'activator_state.dart';

class ActivatorCubit extends Cubit<ActivatorStates>
{
  ActivatorCubit(): super(ActivatorInitialState());
  static  ActivatorCubit get(context) => BlocProvider.of(context);

  Future<void> Activator({
    required int code,

  }) async {
    emit(ActivatorLoadingState());
    await DioHelper.getData(
      url: ApiConstants.activationCodePath(code),
    ).then((value) {
      emit(ActivatorSuccessState());
    }).catchError((error) {
      emit(ActivatorErrorState(error.toString()));
    });
  }
}