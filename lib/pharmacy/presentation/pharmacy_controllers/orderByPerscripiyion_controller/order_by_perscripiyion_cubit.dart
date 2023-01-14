import 'package:dio/dio.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'order_by_perscripiyion_state.dart';


class OrderByPerscripiyionCubit extends Cubit<OrderByPerscripiyionStates> {
  OrderByPerscripiyionCubit() : super(OrderByPerscripiyionInitialState());

  static OrderByPerscripiyionCubit get(context) => BlocProvider.of(context);

  String? imagePath;
  bool ImageChanged = false;

  void pickMedia() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      imagePath = file.path;
      ImageChanged = true;
      emit(PickImageSuccessState());
    }
  }

  void pickMediaCamera() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file != null) {
      imagePath = file.path;
      ImageChanged = true;
      emit(PickImageSuccessState());
    }
  }


  Future <void> orderByPerscription({
    required prescriptionImageFile,
    required pharmacyId,
    required PrescriptionText


  }) async
  {
    emit(OrderByPerscripiyionLoadingState());
    // print(CacheHelper.getData(key: AppConstants.userId));
    // print(password);

    var formData = FormData.fromMap({

      "UserId": CacheHelper.getData(key: AppConstants.userId),
      "PharmacyId": pharmacyId.toString(),
      "PrescriptionText": PrescriptionText,
      "destinationLatitude":AppConstants.myLat,
      "destinationLongitude":AppConstants.myLong,
          "prescriptionImageFile": await MultipartFile.fromFile(
        imagePath!,
        filename: imagePath!
            .split('/')
            .last,
      )
    });
    await DioHelper.postDataFromFormData(
        url: ApiConstants.Prescriptions,
        data: formData)
        .then((value) {
      imagePath = null;
      emit(OrderByPerscripiyionSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(OrderByPerscripiyionErrorState(error.toString()));
    });
  }

}