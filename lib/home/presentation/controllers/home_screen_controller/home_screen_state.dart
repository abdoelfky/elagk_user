
import 'package:elagk/basket/data/notification_model.dart';
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
class GetPharmaciesSuccessState extends HomeScreenState{}
class GetPharmaciesErrorState extends HomeScreenState
{
  final String error;

  GetPharmaciesErrorState(this.error);
}

class GetUserLocationSuccessState extends HomeScreenState {}
class GetUserLocationErrorState extends HomeScreenState {}

class GetPermissionLoadingState extends HomeScreenState {}
class GetPermissionSuccessState extends HomeScreenState {}
class GetPermissionErrorState extends HomeScreenState {}

class SearchDoneSuccessState extends HomeScreenState {}

class GetOffersLoadingState extends HomeScreenState {}
class GetOffersSuccessState extends HomeScreenState{}
class GetOffersErrorState extends HomeScreenState
{
  final String error;

  GetOffersErrorState(this.error);
}

class GetOfferProductsLoadingState extends HomeScreenState {}
class GetOfferProductsSuccessState extends HomeScreenState{}
class GetOfferProductsErrorState extends HomeScreenState
{
  final String error;

  GetOfferProductsErrorState(this.error);
}


class FilterPharmaciesLoadingState extends HomeScreenState {}
class FilterPharmaciesSuccessState extends HomeScreenState {}
class CalculateDistanceSuccessState extends HomeScreenState {}


class GetNotificationLoadingState  extends HomeScreenState {}
class GetNotificationSuccessState  extends HomeScreenState {
  final List<NotificationModel> model;

  GetNotificationSuccessState(this.model);
}
class GetNotificationErrorState  extends HomeScreenState
{
  final String error;

  GetNotificationErrorState(this.error);
}
