import 'dart:async';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
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

  String currentLocation = '';

  Future<void> getLocation(lat, long) async {
    var addresses;
    var first;
    final coordinates = new Coordinates(30.164064, 31.551225);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    first = addresses[5];
    emit(GetLocationState());
    currentLocation = first.addressLine!;
    print('dodo');
    print("${first.addressLine}");
  }

  String distance = '';

  Future<void> getDistance(lat1, long1) async {
    distance =
        await Geolocator.distanceBetween(lat1, long1, 30.16407, 31.551225)
            .round()
            .toString();
    emit(GetLocationState());
    print('dodo');
    print(distance);
  }
}
