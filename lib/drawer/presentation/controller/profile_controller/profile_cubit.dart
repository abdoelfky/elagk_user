import 'dart:io';

import 'package:bloc/bloc.dart';
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
      emit(ProfileGetUserDataSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ProfileGetUserDataErrorState(error.toString()));
    });
  }


  Future<void> updateUserProfileData({
    required String email,
    required String userName,
    required String firstName,
    required String lastName,
    required String phone,
    required String password,
    required File profileImage


  }) async {
    emit(ProfileUpdateUserDataLoadingState());
    // print(CacheHelper.getData(key: AppConstants.userId));
    // print(profileImage.readAsBytes());
    await DioHelper.putData(
      url: ApiConstants.UserIdPath(userModel!.id!),
      data:
      {
        "firstName": userModel!.firstName,
        "lastName": userModel!.lastName,
        "profilePicturePath":userModel!.profilePicturePath,
        "profilePicture": userModel!.profilePicture,
        "isDeleted": userModel!.isDeleted,
        "userPhones":userModel!.userPhones,
        "userActivations": userModel!.userActivations,
        "id": userModel!.id,
        "userName": userModel!.userName,
        "normalizedUserName": userModel!.normalizedUserName,
        "email": userModel!.email,
        "normalizedEmail": userModel!.normalizedEmail,
        "emailConfirmed": userModel!.emailConfirmed,
        "passwordHash": userModel!.passwordHash,
        "securityStamp": userModel!.securityStamp,
        "concurrencyStamp":userModel!.concurrencyStamp,
        "phoneNumber": userModel!.phoneNumber,
        "phoneNumberConfirmed": userModel!.phoneNumberConfirmed,
        "twoFactorEnabled": userModel!.twoFactorEnabled,
        "lockoutEnd": userModel!.lockoutEnd,
        "lockoutEnabled": userModel!.lockoutEnabled,
        "accessFailedCount": userModel!.accessFailedCount
      },
    ).then((value) {
      userModel = UserProfileModel.fromJson(value.data);
      emit(ProfileUpdateUserDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileUpdateUserDataErrorState(error.toString()));
    });
  }


  File?  profileImage;
  var picker = ImagePicker();

  Future <void> getProfileImage() async //
      {
    await picker.pickImage(source: ImageSource.gallery)
        .then((value) {
      profileImage = File(value!.path);
      emit(ProfilePickedSuccessState());
    }).catchError((onError) {
      emit(ProfilePickedErrorState());
    });
  }
}


