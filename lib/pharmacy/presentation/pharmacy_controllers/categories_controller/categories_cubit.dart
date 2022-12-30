import 'dart:async';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:flutter_geocoder/model.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../shared/network/dio_helper.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  static CategoriesCubit get(context) => BlocProvider.of(context);

  Future<void> ResetPass() async {
    emit(CategoriesLoadingState());
    await DioHelper.getData(
      url: ApiConstants.categories,
    ).then((value) {
      emit(CategoriesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategoriesErrorState(error.toString()));
    });
  }
void changeStringsToDef()
{
  AppConstants.pharmacyLocation='';
  AppConstants.distance='';
  emit(StringsChangedSuccessfully());
}

  Future<void> getLocation(lat, long) async {
    var addresses;
    var first;
    final coordinates = new Coordinates(lat,long);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses[0];
    emit(GetLocationState());
    AppConstants.pharmacyLocation = first.addressLine!;
  }

  Future<void> getDistance(lat1, long1) async {
    AppConstants.distance = await Geolocator.distanceBetween(
            lat1, long1, AppConstants.myLat!,AppConstants.myLong!)
        .round()
        .toString();
    emit(GetDistanceState());
    print(AppConstants.distance);
  }
}
