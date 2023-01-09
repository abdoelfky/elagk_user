import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/home/data/models/offer_product_model.dart';
import 'package:elagk/home/data/models/pharmacy_offer_model.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
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
    } catch (error, stacktrace) {
      emit(GetPharmaciesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  LocationPermission? permission;

  void getPermission() {
    emit(GetPermissionLoadingState());
    locationPermission();
  }

  Future<void> locationPermission() async {
    var status = await Permission.location.request();
    if (status == Null){
      permission = await Geolocator.requestPermission().then((value) async {
        var status = await Permission.location.request();
        emit(GetPermissionSuccessState());
        if (status == PermissionStatus.denied ||
            status == PermissionStatus.permanentlyDenied) {
          emit(GetPermissionErrorState());
          permission = await Geolocator.requestPermission();
        } else {
          getUserLocation();
        }
      })
          .catchError((onError) {
        emit(GetPermissionErrorState());
        print('fff');
        print(onError);
        print(permission);
      });}
    else {
      if (status == PermissionStatus.denied ||
          status == PermissionStatus.permanentlyDenied) {
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
    });
  }

  Future<void> getCurrentLocation(lat, long) async {
    List<Address> addresses;
    final coordinates = new Coordinates(lat, long);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);

    emit(GetUserLocationState());
    AppConstants.currentLocation = addresses.first.addressLine
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

  List<OfferProductModel> offerProducts = [];
  Future<void> getOfferProducts({required int pharmacyId}) async {
    offerProducts = [];
    emit(GetOfferProductsLoadingState());
    try {
      Response response = await DioHelper
          .getData(url: ApiConstants.getOfferProducts(pharmacyId));
      offerProducts = (response.data as List)
          .map((x) => OfferProductModel.fromJson(x))
          .toList();
      emit(GetOfferProductsSuccessState());
    } catch (error, stacktrace) {
      emit(GetOfferProductsErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }


}
