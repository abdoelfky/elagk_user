
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';

abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

class ProfileGetUserDataLoadingState  extends HomeScreenState {}
class ProfileGetUserDataSuccessState  extends HomeScreenState
{
  final UserProfileModel userModel;

  ProfileGetUserDataSuccessState(this.userModel);
}
class ProfileGetUserDataErrorState  extends HomeScreenState
{
  final String error;

  ProfileGetUserDataErrorState(this.error);
}


class GetPharmaciesLoadingState extends HomeScreenState {}

class GetPharmaciesSuccessState extends HomeScreenState
{
}

class GetPharmaciesErrorState extends HomeScreenState
{
  final String error;

  GetPharmaciesErrorState(this.error);
}

class GetUserLocationState extends HomeScreenState {}

class GetPermissionLoadingState extends HomeScreenState {}

class GetPermissionSuccessState extends HomeScreenState {}

class GetPermissionErrorState extends HomeScreenState {}

class SearchDoneSuccessState extends HomeScreenState {}

