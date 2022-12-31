import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/home/presentation/controllers/home_screen_controller/home_screen_state.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

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
    if (permission == null)
      permission = await Geolocator.requestPermission().then((value) {
        emit(GetPermissionSuccessState());
        if (value == LocationPermission.deniedForever ||
            value == LocationPermission.denied) {
          emit(GetPermissionErrorState());
        } else {
          getUserLocation();
        }
      }).catchError((onError) {
        emit(GetPermissionErrorState());
        print('fff');
        print(onError);
        print(permission);
      });
    else {
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
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
    AppConstants.currentLocation = addresses
        .sublist(3,addresses.length)
        .first
        .addressLine
        .toString();
    getPharmacies();
    // print("${addresses.addressLine}");
    // print("permission:${permission.toString()}");
  }
}
