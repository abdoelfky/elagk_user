
abstract class HomeScreenState {}

class HomeScreenInitialState extends HomeScreenState {}

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

