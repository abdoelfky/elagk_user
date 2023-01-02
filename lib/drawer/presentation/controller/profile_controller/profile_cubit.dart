import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elagk/drawer/data/models/profile/user_profile_model.dart';
import 'package:elagk/shared/local/shared_preference.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/network/dio_helper.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);

  UserProfileModel? userModel;

  Future<void> getUserProfileData() async {
    emit(ProfileGetUserDataLoadingState());
    print(CacheHelper.getData(key: AppConstants.userId));
    await DioHelper.getData(
      url: ApiConstants.UserIdPath(
          CacheHelper.getData(key: AppConstants.userId).toString()),
    ).then((value) {
      userModel = UserProfileModel.fromJson(value.data);
      profileImageChanged=false;
      emit(ProfileGetUserDataSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ProfileGetUserDataErrorState(error.toString()));
    });
  }

  Future<void> updateUserProfileData(
      {required String email,
        required String firstName,
        required String lastName,
        required String phones,
        required String userName,
      }) async {
    emit(ProfileUpdateUserDataLoadingState());
    // print(CacheHelper.getData(key: AppConstants.userId));
    // print(password);

    var formData =  profileImageChanged ? FormData.fromMap({
      "FirstName": firstName,
      "LastName": lastName,
      "UserName":userName,
      "Email": email,
      "OldPassword": userModel!.passwordHash,
      "Phones":[phones],
      "profilePicture":await MultipartFile.fromFile(
        profileImage!.path,
        filename: profileImage!.path.split('/').last,
      )
    }):FormData.fromMap({
      "FirstName": firstName,
      "LastName": lastName,
      "UserName":userName,
      "Email": email,
      "OldPassword": userModel!.passwordHash,
      "Phones":[phones],
      "ProfilePicturePath":userModel!.profilePicturePath

    });
    await DioHelper.putData(
        url: ApiConstants.UserIdPath(
            CacheHelper.getData(key: AppConstants.userId).toString()),
        data: formData)
        .then((value) {
      // userModel = UserProfileModel.fromJson(value.data);
      getUserProfileData();
      emit(ProfileUpdateUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileUpdateUserDataErrorState(error.toString()));
    });
  }

  File? profileImage;
  ImagePicker picker = ImagePicker();
  bool profileImageChanged=false;
  Future<void> getProfileImageGallery() async //
      {

    await picker.pickImage(source: ImageSource.gallery,imageQuality: 50, maxHeight: 500.0, maxWidth: 500.0).then((value) async {
      profileImage = File(value!.path);
      // print(profileImage!.readAsBytes());
      profileImageChanged=true;
      emit(ProfilePickedSuccessState());
    }).catchError((onError) {
      emit(ProfilePickedErrorState());
    });
  }

  void getProfileImageCamera() async {
    await picker.pickImage(source: ImageSource.camera).then((value) {
      profileImage = File(value!.path);
      emit(ProfilePickedSuccessState());
    }).catchError((onError) {
      emit(ProfilePickedErrorState());
    });
  }
}
