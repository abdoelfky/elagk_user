
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