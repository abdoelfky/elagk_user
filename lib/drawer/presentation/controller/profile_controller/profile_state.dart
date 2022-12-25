part of 'profile_cubit.dart';

@immutable
abstract class ProfileStates {}

class ProfileInitialState extends ProfileStates {}

class ProfileGetUserDataLoadingState  extends ProfileStates {}

class ProfileGetUserDataSuccessState  extends ProfileStates
{
  final UserProfileModel userModel;

  ProfileGetUserDataSuccessState(this.userModel);
}

class ProfileGetUserDataErrorState  extends ProfileStates
{
  final String error;

  ProfileGetUserDataErrorState(this.error);
}


class ProfileUpdateUserDataLoadingState  extends ProfileStates {}

class ProfileUpdateUserDataSuccessState  extends ProfileStates {}

class ProfileUpdateUserDataErrorState  extends ProfileStates
{
  final String error;

  ProfileUpdateUserDataErrorState(this.error);
}