import 'package:elagk/auth/data/models/register_model/register_model.dart';
import 'package:elagk/auth/presentation/controller/reset_password_controller/reset_password_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/dio_helper.dart';
import '../../../data/models/login_model/login_model.dart';


class ForgetPasswordCubit extends Cubit<ForgetPasswordStates>
{
  ForgetPasswordCubit(): super(ForgetPasswordInitialState());

  static  ForgetPasswordCubit get(context) => BlocProvider.of(context);



  Future<void> sendOTP({
    required String email,

  }) async {
    emit(SendOTPLoadingState());
    await DioHelper.getData(
      url: ApiConstants.forgetPasswordEmailPath(email),
    ).then((value) {
      emit(SendOTPSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SendOTPErrorState(error.toString()));
    });}


}