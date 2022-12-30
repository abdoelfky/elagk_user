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

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitialState());


  static  HomeScreenCubit get(context) => BlocProvider.of(context);

  //get All Pharmacies
  List<PharmacyModel> pharmacies=[];
  Future<void> getPharmacies() async {
    emit(GetPharmaciesLoadingState());
    try {
      Response response = await DioHelper.getData( url:ApiConstants.pharmacies);
      pharmacies=(response.data as List)
          .map((x) => PharmacyModel.fromJson(x))
          .toList();
      emit(GetPharmaciesSuccessState());

    } catch (error, stacktrace) {
      emit(GetPharmaciesErrorState(error.toString()));

      throw Exception("Exception occured: $error stackTrace: $stacktrace");

    }
  }

  LocationPermission? permission;

  Future<void> locationPermission()
  async{
    permission = await Geolocator.requestPermission().whenComplete(()
    {
      getUserLocation();
    });

  }

  //get Current Location
  LatLng? currentPostion;
  Future<void> getUserLocation() async {

    await GeolocatorPlatform.instance
        .getCurrentPosition().then((value)
    {
      currentPostion = LatLng(value.latitude, value.longitude);
      getCurrentLocation(currentPostion!.latitude, currentPostion!.longitude);
      AppConstants.myLat=currentPostion!.latitude;
      AppConstants.myLong=currentPostion!.longitude;
    });

  }


  String currentLocation='';
  Future<void> getCurrentLocation(lat,long)
  async {
    var addresses;
    var first;
    final coordinates = new Coordinates(lat,long);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses[5];
    emit(GetUserLocationState());
    currentLocation=first.addressLine!;
    print("${first.addressLine}");
    print("permission:${permission.toString()}");
  }



}
