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

  Duration duration = Duration();
  void otpCounter ()async {
    duration = new Duration();
    const countdownDuration = Duration(minutes: 3);
    Timer? timer;
    bool countDown =true;
    duration = countdownDuration;
    void addTime(){
      final addSeconds = countDown ? -1 : 1;
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0){
        timer?.cancel();
        emit(ChangeDurationEndState());

      } else{
        emit(ChangeDurationStartState());
        duration = Duration(seconds: seconds);
      }
    }
    void startTimer(){
      timer = Timer.periodic(Duration(seconds: 1),(_) => addTime());
      emit(ChangeDurationLoadingState());
    }
    startTimer();

  }



}