import 'package:elagk/auth/data/models/login_model/login_model.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates
{
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}

class ProfileGetUserDataLoadingState  extends LoginStates {}

class ProfileGetUserDataSuccessState  extends LoginStates
{
  final UserProfileModel userModel;

  ProfileGetUserDataSuccessState(this.userModel);
}

class ProfileGetUserDataErrorState  extends LoginStates
{
  final String error;

  ProfileGetUserDataErrorState(this.error);
}

