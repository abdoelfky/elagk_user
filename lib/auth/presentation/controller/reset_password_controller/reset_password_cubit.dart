import 'dart:async';
import 'package:elagk/auth/data/models/reset_model/reset_model.dart';
import 'package:elagk/auth/presentation/controller/reset_password_controller/reset_password_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../drawer/data/models/profile/user_profile_model.dart';
import '../../../../shared/network/dio_helper.dart';
import '../../screens/reset_password/reset_password_screen.dart';



class ResetPasswordCubit extends Cubit<ResetPasswordStates>
{
  ResetPasswordCubit(): super(ResetPasswordInitialState());

  static  ResetPasswordCubit get(context) => BlocProvider.of(context);


  ResetModel? resetModel;

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
      resetModel = ResetModel.fromJson(value.data);
      emit(ResetPassSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ResetPassErrorState(error.toString()));
    });}


}