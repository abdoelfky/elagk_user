import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/basket/data/notification_model.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/home/data/models/pharmacy_offer_model.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/main.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/data/product_model.dart';
import 'package:elagk/shared/config/noti.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);


//userData
  Future<void> getUserProfileData() async {
    emit(ProfileGetUserDataLoadingState());
    print(CacheHelper.getData(key: AppConstants.userId));
    await DioHelper.getData(
      url: ApiConstants.UserIdPath(
          CacheHelper.getData(key: AppConstants.userId).toString()),
    ).then((value) {
      AppConstants.userModel = UserProfileModel.fromJson(value.data);
      print(AppConstants.userModel!.lastName!);
      emit(ProfileGetUserDataSuccessState(AppConstants.userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ProfileGetUserDataErrorState(error.toString()));
    });
  }



  //get All Pharmacies
  List<PharmacyModel> pharmacies = [];
  Future<void> getPharmacies() async {
    pharmacies = [];
    emit(GetPharmaciesLoadingState());
    try {
      Response response = await DioHelper.getData(url: ApiConstants.pharmacies);
      pharmacies = (response.data as List)
          .map((x) => PharmacyModel.fromJson(x))
          .toList();
      emit(GetPharmaciesSuccessState());
      filterPharmacies();
    } catch (error, stacktrace) {
      emit(GetPharmaciesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  List<PharmacyModel> filteredPharmacies=[];
  List<PharmacyOfferModel> filteredOffers = [];

  void filterPharmacies()
  {
    filteredPharmacies=[];
    filteredOffers = [];
    emit(FilterPharmaciesLoadingState());
    pharmacies.forEach((element)
    {
      getDistance(element.latitude,element.longitude).then((value)
      {
        print("lat1:${element.latitude}");
        print("long1:${element.longitude}");
        print("myLat:${AppConstants.myLat}");
        print("myLong:${AppConstants.myLong}");
        print(distance.toString());
        if(distance! < 20000)
        {
          filteredPharmacies.add(element);
        }
      });
    });
    offers.forEach((element)
    {
      getDistance(element.latitude,element.longitude).then((value)
      {
        print(distance.toString());
        if(distance! < 20000)
        {
          filteredOffers.add(element);
        }
      });
    });
    emit(FilterPharmaciesSuccessState());

  }

  int? distance;
//get distance by mitres
  Future<void> getDistance(lat1, long1) async {

    distance = await Geolocator.distanceBetween(
        lat1, long1, AppConstants.myLat!,AppConstants.myLong!)
        .round();
    emit(CalculateDistanceSuccessState());
    print(AppConstants.distance);
  }



  LocationPermission? permission;

  void getPermission() {
    emit(GetPermissionLoadingState());
    locationPermission();
  }

  bool permissionStatue=true;
  Future<void> locationPermission() async {
    var status = await Permission.location.request();
    if (status == Null) {
      permission = await Geolocator.requestPermission().then((value) async {
        var status = await Permission.location.request();
        emit(GetPermissionSuccessState());
        if (status == PermissionStatus.denied ||
            status == PermissionStatus.permanentlyDenied) {
          permissionStatue = false;
          emit(GetPermissionErrorState());
          permission = await Geolocator.requestPermission();
        } else {
          getUserLocation();
        }
      })
          .catchError((onError) {
        permissionStatue = false;
        emit(GetPermissionErrorState());
        print('fff');
        print(onError);
        print(permission);
      });
    }
    else {
      if (status == PermissionStatus.denied ||
          status == PermissionStatus.permanentlyDenied) {
        permissionStatue = false;
        emit(GetPermissionErrorState());
      } else {
        getUserLocation();
      }
    }
  }
  //get Current Location
  LatLng? currentPostion;

  Future<void> getUserLocation() async {
    await GeolocatorPlatform.instance.getCurrentPosition().then((value) {
      currentPostion = LatLng(value.latitude, value.longitude);
      getCurrentLocation(currentPostion!.latitude, currentPostion!.longitude);
      AppConstants.myLat = currentPostion!.latitude;
      AppConstants.myLong = currentPostion!.longitude;
    }).catchError((onError){
      emit(GetUserLocationErrorState());
    });
  }

  Future<void> getCurrentLocation(lat, long) async {
    List<Address> addresses;
    final coordinates = new Coordinates(lat, long);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

    emit(GetUserLocationSuccessState());
    AppConstants.currentLocation = addresses[2].addressLine
        .toString();
    getPharmacies();
    // print("${addresses.addressLine}");
    // print("permission:${permission.toString()}");
  }

  String searchWord='';

  List<PharmacyModel> searchResult=[];
  void search()
  {
    if(searchWord!=''){
      searchResult=[];
      searchResult = pharmacies
          .where((pharmacy) =>
          pharmacy.pharmacyName!.toLowerCase()
              .contains(searchWord.toLowerCase()))
          .toList();
      emit(SearchDoneSuccessState());
    }
    else
    {
      searchWord='';
      emit(SearchDoneSuccessState());

    }

  }


  List<PharmacyOfferModel> offers = [];
  Future<void> getOffers() async {
    offers = [];
    emit(GetOffersLoadingState());
    try {
      Response response = await DioHelper
          .getData(url: ApiConstants.getOffers);
      offers = (response.data as List)
          .map((x) => PharmacyOfferModel.fromJson(x))
          .toList();
      emit(GetOffersSuccessState());
    } catch (error, stacktrace) {
      emit(GetOffersErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  List<ProductModel> offerProducts = [];
  Future<void> getOfferProducts({required int pharmacyId}) async {
    offerProducts = [];
    emit(GetOfferProductsLoadingState());
    try {
      Response response = await DioHelper
          .getData(url: ApiConstants.getOfferProducts(pharmacyId));
      offerProducts = (response.data as List)
          .map((x) => ProductModel.fromJson(x))
          .toList();
      emit(GetOfferProductsSuccessState());
    } catch (error, stacktrace) {
      emit(GetOfferProductsErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }




  //get notification
  List<NotificationModel> notifications = [];
  NotificationModel? lastNotification;

  Timer? timer;

  Future<void> getNotifications() async {
    notifications = [];

    emit(GetNotificationLoadingState());

    try {
      Response response = await Dio().get(
          ApiConstants.getNotifications(
              CacheHelper.getData(key: AppConstants.userId)));
      notifications = (response.data as List)
          .map((x) => NotificationModel.fromJson(x))
          .toList();
      notifications=notifications.reversed.toList();
      print(notifications.length);
      print(CacheHelper.getData(key: AppConstants.userId));
      if(AppConstants.notificationLength<notifications.length) {
        lastNotification=notifications.first;
        getNotify();
      }
      AppConstants.notificationLength=notifications.length;

      emit(GetNotificationSuccessState(notifications));
    } catch (error, stacktrace) {
      emit(GetNotificationErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }

  }




  void getNotify()
  {

    Noti.showBigTextNotification(
        title: "${lastNotification!.notifiactionTitle}",
        body: "${lastNotification!.notifiactionDescription}",
        fln: flutterLocalNotificationsPlugin);

  }

  void checkNotifications()
  {
    timer = Timer.periodic(Duration(seconds: 20), (Timer t)=>getNotifications());

  }



}
