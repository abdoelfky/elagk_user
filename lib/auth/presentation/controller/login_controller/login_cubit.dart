import 'package:elagk/auth/data/models/login_model/login_model.dart';
import 'package:elagk/auth/presentation/controller/login_controller/login_states.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    await DioHelper.postData(
      url: ApiConstants.login,
      data: {"email": email, "password": password},
    ).then((value) {
      print(value.data.toString());

      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.setData(key: AppConstants.userId, value: loginModel!.userId);
      CacheHelper.setData(key: AppConstants.token, value: loginModel!.token);
      CacheHelper.setData(
          key: AppConstants.userName, value: loginModel!.username);
      if (loginModel!.roles!.first.toLowerCase() == 'user') {
        emit(LoginSuccessState(loginModel!));
      } else {
        emit(LoginErrorState('غير مسموح بتسجيل دخول هذا المستخدم'));
      }
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState('كلمه المرور او البريد الالكتروني خطأ'));
    });
  }

  bool isObsecured=true;

  void changeVisibility()
  {
    isObsecured=!isObsecured;
    emit(ChangeVisibilityState());
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

}
