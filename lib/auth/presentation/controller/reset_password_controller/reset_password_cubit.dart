import 'package:elagk/auth/presentation/controller/reset_password_controller/reset_password_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/dio_helper.dart';



class ResetPasswordCubit extends Cubit<ResetPasswordStates>
{
  ResetPasswordCubit(): super(ResetPasswordInitialState());

  static  ResetPasswordCubit get(context) => BlocProvider.of(context);



  Future<void> ResetPass({
    required String password,
    required String email,


  }) async {
    emit(ResetPassLoadingState());
    await DioHelper.postData(
      url: ApiConstants.resetPassword,
      data: {
        'password': password,
        'email': email,

      },
    ).then((value) {
      emit(ResetPassSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ResetPassErrorState(error.toString()));
    });}


}