import 'dart:async';

import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/dio_helper.dart';

import 'otp_password_state.dart';

class OtpPasswordCubit extends Cubit<OtpPasswordStates>
{
  OtpPasswordCubit(): super(OtpPasswordInitialState());
  static  OtpPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> Otp({
    required int code,

  }) async {
    emit(OtpLoadingState());
    await DioHelper.getData(
      url: ApiConstants.activationCodePath(code),
    ).then((value) {
      emit(OtpSuccessState());
    }).catchError((error) {
      emit(OtpErrorState(error.toString()));
    });}

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