import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/dio_helper.dart';
import 'forget_passowrd_state.dart';


class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>
{
  ForgetPasswordCubit(): super(ForgetPasswordInitialState());

  static  ForgetPasswordCubit get(context) => BlocProvider.of(context);



  Future<void> sendOTP({
    required String email,

  }) async {
    emit(SendOTPLoadingState());
    await DioHelper.postData(
      url: ApiConstants.sendMail,
      data:
      {
        "email": email,

      }
    ).then((value) {
      emit(SendOTPSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendOTPErrorState(error.toString()));
    });}


}